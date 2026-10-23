<?php
require_once __DIR__ . '/config/auth.php';
require_once __DIR__ . '/config/conexao.php';

if (usuario_logado()) {
    redirecionar('index.html');
}

$erro = '';
$nome = '';
$email = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = trim((string) ($_POST['nome'] ?? ''));
    $email = trim((string) ($_POST['email'] ?? ''));
    $senha = (string) ($_POST['senha'] ?? '');
    $confirmacao = (string) ($_POST['confirmacao'] ?? '');

    if (!csrf_valido($_POST['csrf'] ?? null)) {
        $erro = 'Sessão expirada. Tente novamente.';
    } elseif (mb_strlen($nome) < 2 || mb_strlen($nome) > 100) {
        $erro = 'Digite seu nome (de 2 a 100 caracteres).';
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL) || strlen($email) > 190) {
        $erro = 'Digite um e-mail válido.';
    } elseif (strlen($senha) < 8) {
        $erro = 'A senha precisa ter no mínimo 8 caracteres.';
    } elseif (strlen($senha) > 4096) {
        $erro = 'A senha informada é muito longa.';
    } elseif ($senha !== $confirmacao) {
        $erro = 'As senhas não são iguais.';
    } else {
        $stmt = $pdo->prepare('SELECT id FROM usuarios WHERE email = :email LIMIT 1');
        $stmt->execute(['email' => $email]);

        if ($stmt->fetch()) {
            $erro = 'Este e-mail já está cadastrado.';
        } else {
            try {
                $stmt = $pdo->prepare('INSERT INTO usuarios (nome, email, senha) VALUES (:nome, :email, :senha)');
                $stmt->execute([
                    'nome'  => $nome,
                    'email' => $email,
                    'senha' => password_hash($senha, PASSWORD_DEFAULT),
                ]);
                entrar_na_sessao(['id' => $pdo->lastInsertId(), 'nome' => $nome]);
                redirecionar('index.html');
            } catch (PDOException $ex) {
                // 23000 = e-mail duplicado (cadastro simultâneo)
                $erro = $ex->getCode() === '23000'
                    ? 'Este e-mail já está cadastrado.'
                    : 'Não foi possível concluir o cadastro. Tente de novo.';
                if ($ex->getCode() !== '23000') {
                    error_log('Erro no cadastro: ' . $ex->getMessage());
                }
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
  <title>Cadastro — F1RACER</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Outfit:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
</head>
<body data-page="cadastro">
<div id="site-header"></div>
<main class="auth-wrap"><div class="auth-card">
  <p class="eyebrow">Crie sua conta</p>
  <h1 class="display h1" style="font-size:3rem">Cadastro</h1>

  <form method="POST" action="cadastro.php" novalidate>
    <input type="hidden" name="csrf" value="<?= e_html(csrf_token()) ?>">
    <div class="field"><label for="nome">Nome</label>
      <input id="nome" name="nome" type="text" required minlength="2" maxlength="100" autocomplete="name"
             placeholder="Seu nome" value="<?= e_html($nome) ?>"></div>
    <div class="field"><label for="email">E-mail</label>
      <input id="email" name="email" type="email" required maxlength="190" autocomplete="email"
             placeholder="voce@email.com" value="<?= e_html($email) ?>"></div>
    <div class="field"><label for="senha">Senha</label>
      <input id="senha" name="senha" type="password" required minlength="8" maxlength="4096" autocomplete="new-password"
             placeholder="Mínimo 8 caracteres"></div>
    <div class="field"><label for="confirmacao">Confirmar senha</label>
      <input id="confirmacao" name="confirmacao" type="password" required minlength="8" maxlength="4096" autocomplete="new-password"
             placeholder="Repita a senha"></div>
    <?php if ($erro): ?><p class="msg-error show" role="alert"><?= e_html($erro) ?></p><?php endif; ?>
    <button class="btn" type="submit">Criar conta</button>
  </form>
  <p class="alt"><a href="entrar.php">Já tem conta? <b>Entrar</b></a></p>
</div></main>
<div id="site-footer"></div>
<script src="js/data.js"></script>
<script src="js/app.js"></script>
</body>
</html>
