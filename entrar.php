<?php
require_once __DIR__ . '/config/auth.php';

if (usuario_logado()) {
    redirecionar('index.html');
}

$erro = $_SESSION['flash_erro'] ?? '';
$emailAnterior = $_SESSION['flash_email'] ?? '';
$sucesso = $_SESSION['flash_ok'] ?? '';
unset($_SESSION['flash_erro'], $_SESSION['flash_email'], $_SESSION['flash_ok']);
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="theme-color" content="#0A0A0A">
  <title>Entrar — F1RACER</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Outfit:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
</head>
<body data-page="entrar">
<div id="site-header"></div>
<main class="auth-wrap"><div class="auth-card">
  <p class="eyebrow">Acesse sua conta</p>
  <h1 class="display h1" style="font-size:3rem">Entrar</h1>

  <form method="POST" action="login.php" novalidate>
    <input type="hidden" name="csrf" value="<?= e_html(csrf_token()) ?>">
    <div class="field"><label for="email">E-mail</label>
      <input id="email" name="email" type="email" required maxlength="190" autocomplete="email"
             placeholder="voce@email.com" value="<?= e_html($emailAnterior) ?>"></div>
    <div class="field"><label for="senha">Senha</label>
      <input id="senha" name="senha" type="password" required maxlength="4096" autocomplete="current-password"
             placeholder="••••••••"></div>
    <?php if ($sucesso): ?><p class="msg-error show" role="status" style="border-color:rgba(34,197,94,.4);background:rgba(34,197,94,.1)"><?= e_html($sucesso) ?></p><?php endif; ?>
    <?php if ($erro): ?><p class="msg-error show" role="alert"><?= e_html($erro) ?></p><?php endif; ?>
    <button class="btn" type="submit">Entrar</button>
  </form>
  <p class="alt"><a href="esqueceu-senha.php">Esqueceu a senha?</a></p>
  <p class="alt" style="margin-top:8px"><a href="cadastro.php">Não tem conta? <b>Cadastre-se</b></a></p>
</div></main>
<div id="site-footer"></div>
<script src="js/data.js"></script>
<script src="js/app.js"></script>
</body>
</html>
