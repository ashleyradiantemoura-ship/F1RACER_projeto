<?php
/* Processa o formulário de entrar.php (só aceita POST). */
require_once __DIR__ . '/config/auth.php';
require_once __DIR__ . '/config/conexao.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    redirecionar('entrar.php');
}

function falhar(string $mensagem, string $email = ''): never {
    $_SESSION['flash_erro'] = $mensagem;
    $_SESSION['flash_email'] = $email;
    redirecionar('entrar.php');
}

$email = trim((string) ($_POST['email'] ?? ''));
$senha = (string) ($_POST['senha'] ?? '');

if (!csrf_valido($_POST['csrf'] ?? null)) {
    falhar('Sessão expirada. Tente novamente.', $email);
}

// Freio simples contra tentativas em sequência: 5 erros = espera de 60 s.
if (($_SESSION['login_bloqueado_ate'] ?? 0) > time()) {
    falhar('Muitas tentativas. Aguarde um minuto e tente de novo.', $email);
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL) || $senha === '' || strlen($senha) > 4096) {
    falhar('Informe e-mail e senha válidos.', $email);
}

$stmt = $pdo->prepare('SELECT id, nome, senha FROM usuarios WHERE email = :email AND ativo = 1 LIMIT 1');
$stmt->execute(['email' => $email]);
$usuario = $stmt->fetch();

// Sempre roda password_verify, para não revelar se o e-mail existe pelo tempo de resposta.
$hash = $usuario['senha'] ?? '$2y$10$usesomesillystringforsalt.abcdefghijklmnopqrstuvwxyzABCD';
$confere = password_verify($senha, $hash);

if (!$usuario || !$confere) {
    $_SESSION['login_erros'] = ($_SESSION['login_erros'] ?? 0) + 1;
    if ($_SESSION['login_erros'] >= 5) {
        $_SESSION['login_erros'] = 0;
        $_SESSION['login_bloqueado_ate'] = time() + 60;
    }
    falhar('E-mail ou senha incorretos.', $email);
}

if (password_needs_rehash($hash, PASSWORD_DEFAULT)) {
    $pdo->prepare('UPDATE usuarios SET senha = :s WHERE id = :id')
        ->execute(['s' => password_hash($senha, PASSWORD_DEFAULT), 'id' => $usuario['id']]);
}

unset($_SESSION['login_erros'], $_SESSION['login_bloqueado_ate']);
entrar_na_sessao($usuario);
redirecionar('index.html');
