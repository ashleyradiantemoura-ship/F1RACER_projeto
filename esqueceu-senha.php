
<?php
session_start();

require_once __DIR__ . '/config/conexao.php';
require_once __DIR__ . '/config/resend.php';
require_once __DIR__ . '/config/auth.php';

$mensagem = '';
$erro = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email'] ?? '');

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $erro = 'Digite um endereço de e-mail válido.';
    } elseif (
    RESEND_API_KEY === ''
    || trim(RESEND_API_KEY) === ''
) {
        $erro = 'O envio de e-mail ainda não foi configurado. Coloque a chave da API em config/resend.php.';
    } else {
        // A resposta é igual exista ou não o e-mail cadastrado.
        $mensagem = 'Se o e-mail estiver cadastrado, você receberá um link de recuperação.';

        $stmt = $pdo->prepare(
            'SELECT id, nome, email FROM usuarios
             WHERE email = :email AND ativo = 1 LIMIT 1'
        );
        $stmt->execute(['email' => $email]);
        $usuario = $stmt->fetch();

        if ($usuario) {
            // Token aleatório: o valor original só vai para o link.
            $token = bin2hex(random_bytes(32));
            $tokenHash = hash('sha256', $token);

            // Validade de 30 minutos.
            $expira = (new DateTimeImmutable('+30 minutes'))
                ->format('Y-m-d H:i:s');

            try {
                $pdo->beginTransaction();

                // Invalida solicitações anteriores ainda não utilizadas.
                $stmt = $pdo->prepare(
                    'UPDATE recuperacao_senha
                     SET usado_em = NOW()
                     WHERE usuario_id = :id AND usado_em IS NULL'
                );
                $stmt->execute(['id' => $usuario['id']]);

                $stmt = $pdo->prepare(
                    'INSERT INTO recuperacao_senha
                     (usuario_id, token_hash, expira_em)
                     VALUES (:id, :token, :expira)'
                );
                $stmt->execute([
                    'id' => $usuario['id'],
                    'token' => $tokenHash,
                    'expira' => $expira
                ]);

                $pdo->commit();
            } catch (Throwable $e) {
                if ($pdo->inTransaction()) {
                    $pdo->rollBack();
                }

                error_log('Erro ao criar recuperação: ' . $e->getMessage());
                http_response_code(500);
                exit('Não foi possível processar a solicitação.');
            }

            // Monta o link automaticamente a partir da pasta onde o site está rodando.
            $pasta = rtrim(dirname($_SERVER['SCRIPT_NAME']), '/\\');
            $urlBase = 'http://localhost' . $pasta . '/redefinir-senha.php';

            $link = $urlBase . '?token=' . urlencode($token);

            $nome = htmlspecialchars(
                $usuario['nome'],
                ENT_QUOTES,
                'UTF-8'
            );

            $linkSeguro = htmlspecialchars(
                $link,
                ENT_QUOTES,
                'UTF-8'
            );

            $html = "
                <div style='font-family:Arial,sans-serif;max-width:560px;margin:auto;color:#222'>
                    <h1 style='color:#e10600'>F1RACER</h1>
                    <h2>Recuperação de senha</h2>
                    <p>Olá, {$nome}!</p>
                    <p>Recebemos uma solicitação para redefinir a senha da sua conta.</p>
                    <p>
                        <a href='{$linkSeguro}'
                           style='display:inline-block;background:#e10600;color:white;padding:14px 22px;text-decoration:none;border-radius:5px'>
                           Criar nova senha
                        </a>
                    </p>
                    <p>Este link expira em 30 minutos e só pode ser usado uma vez.</p>
                    <p>Se você não solicitou essa alteração, ignore este e-mail.</p>
                </div>
            ";

            if (!enviarEmailResend(
                $usuario['email'],
                'Recuperação de senha — F1RACER',
                $html
            )) {
                // Não exponha erros internos nem dados da conta ao visitante.
                error_log(
                    'Falha no envio de recuperação para usuário ID '
                    . $usuario['id']
                );
            }
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
  <title>Recuperar senha — F1RACER</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Outfit:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
</head>
<body data-page="entrar">
<div id="site-header"></div>
<main class="auth-wrap"><div class="auth-card">
  <p class="eyebrow">Recuperar acesso</p>
  <h1 class="display h1" style="font-size:3rem">Esqueceu a senha?</h1>
  <p style="margin-top:16px;color:#a1a1aa;font-size:14px">Informe o e-mail do seu cadastro e enviaremos um link para criar uma nova senha.</p>

  <form method="POST" action="esqueceu-senha.php" novalidate>
    <div class="field"><label for="email">E-mail</label>
      <input id="email" name="email" type="email" required maxlength="190" autocomplete="email" placeholder="voce@email.com"></div>
    <?php if ($mensagem): ?><p class="msg-error show" role="status" style="border-color:rgba(34,197,94,.4);background:rgba(34,197,94,.1)"><?= e_html($mensagem) ?></p><?php endif; ?>
    <?php if ($erro): ?><p class="msg-error show" role="alert"><?= e_html($erro) ?></p><?php endif; ?>
    <button class="btn" type="submit">Enviar link de recuperação</button>
  </form>
  <p class="alt"><a href="entrar.php">Voltar ao <b>login</b></a></p>
</div></main>
<div id="site-footer"></div>
<script src="js/data.js"></script>
<script src="js/app.js"></script>
</body>
</html>
