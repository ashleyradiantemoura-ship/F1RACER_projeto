
<?php
session_start();

require_once __DIR__ . '/config/conexao.php';
require_once __DIR__ . '/config/auth.php';

$erro = '';
$sucesso = false;
$token = $_GET['token'] ?? $_POST['token'] ?? '';

if (
    !is_string($token) ||
    !preg_match('/\A[a-f0-9]{64}\z/', $token)
) {
    $token = '';
    $erro = 'Link inválido ou expirado.';
}

if ($token !== '') {
    $tokenHash = hash('sha256', $token);

    $stmt = $pdo->prepare(
        'SELECT id, usuario_id
         FROM recuperacao_senha
         WHERE token_hash = :token
           AND usado_em IS NULL
           AND expira_em > NOW()
         LIMIT 1'
    );
    $stmt->execute(['token' => $tokenHash]);
    $recuperacao = $stmt->fetch();

    if (!$recuperacao) {
        $erro = 'Link inválido ou expirado. Solicite outro.';
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && $token !== '' && isset($recuperacao)) {
    $senha = $_POST['senha'] ?? '';
    $confirmacao = $_POST['confirmacao'] ?? '';

    if (!is_string($senha) || !is_string($confirmacao)) {
        $erro = 'Dados inválidos.';
    } elseif (strlen($senha) < 8) {
        $erro = 'A senha precisa ter pelo menos 8 caracteres.';
    } elseif (strlen($senha) > 4096) {
        $erro = 'A senha informada é muito longa.';
    } elseif ($senha !== $confirmacao) {
        $erro = 'As senhas não são iguais.';
    } else {
        try {
            $pdo->beginTransaction();

            // Bloqueia o registro para impedir uso simultâneo do token.
            $stmt = $pdo->prepare(
                'SELECT id, usuario_id
                 FROM recuperacao_senha
                 WHERE id = :id
                   AND token_hash = :token
                   AND usado_em IS NULL
                   AND expira_em > NOW()
                 FOR UPDATE'
            );
            $stmt->execute([
                'id' => $recuperacao['id'],
                'token' => $tokenHash
            ]);

            $registro = $stmt->fetch();

            if (!$registro) {
                $pdo->rollBack();
                $erro = 'Link inválido ou expirado. Solicite outro.';
            } else {
                $hashSenha = password_hash($senha, PASSWORD_DEFAULT);

                $stmt = $pdo->prepare(
                    'UPDATE usuarios
                     SET senha = :senha
                     WHERE id = :usuario_id'
                );
                $stmt->execute([
                    'senha' => $hashSenha,
                    'usuario_id' => $registro['usuario_id']
                ]);

                $stmt = $pdo->prepare(
                    'UPDATE recuperacao_senha
                     SET usado_em = NOW()
                     WHERE id = :id'
                );
                $stmt->execute(['id' => $registro['id']]);

                // Invalida outros links de recuperação do usuário.
                $stmt = $pdo->prepare(
                    'UPDATE recuperacao_senha
                     SET usado_em = NOW()
                     WHERE usuario_id = :usuario_id
                       AND id <> :id
                       AND usado_em IS NULL'
                );
                $stmt->execute([
                    'usuario_id' => $registro['usuario_id'],
                    'id' => $registro['id']
                ]);

                $pdo->commit();
                $sucesso = true;
            }
        } catch (Throwable $e) {
            if ($pdo->inTransaction()) {
                $pdo->rollBack();
            }

            error_log('Erro ao redefinir senha: ' . $e->getMessage());
            http_response_code(500);
            $erro = 'Não foi possível alterar a senha agora.';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="theme-color" content="#0A0A0A">
  <title>Nova senha — F1RACER</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Outfit:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
</head>
<body data-page="entrar">
<div id="site-header"></div>
<main class="auth-wrap"><div class="auth-card">
  <p class="eyebrow">Recuperar acesso</p>
  <h1 class="display h1" style="font-size:3rem">Nova senha</h1>

  <?php if ($sucesso): ?>
    <p class="msg-error show" role="status" style="margin-top:24px;border-color:rgba(34,197,94,.4);background:rgba(34,197,94,.1)">Senha alterada com sucesso!</p>
    <p class="alt"><a href="entrar.php"><b>Ir para o login</b></a></p>

  <?php elseif ($erro && !isset($recuperacao)): ?>
    <p class="msg-error show" role="alert" style="margin-top:24px"><?= e_html($erro) ?></p>
    <p class="alt"><a href="esqueceu-senha.php"><b>Solicitar novo link</b></a></p>

  <?php else: ?>
    <form method="POST" action="redefinir-senha.php" novalidate>
      <input type="hidden" name="token" value="<?= e_html($token) ?>">
      <div class="field"><label for="senha">Nova senha</label>
        <input id="senha" name="senha" type="password" required minlength="8" maxlength="4096" autocomplete="new-password" placeholder="Mínimo 8 caracteres"></div>
      <div class="field"><label for="confirmacao">Confirmar nova senha</label>
        <input id="confirmacao" name="confirmacao" type="password" required minlength="8" maxlength="4096" autocomplete="new-password" placeholder="Repita a senha"></div>
      <?php if ($erro): ?><p class="msg-error show" role="alert"><?= e_html($erro) ?></p><?php endif; ?>
      <button class="btn" type="submit">Salvar nova senha</button>
    </form>
  <?php endif; ?>
</div></main>
<div id="site-footer"></div>
<script src="js/data.js"></script>
<script src="js/app.js"></script>
</body>
</html>
