<?php
declare(strict_types=1);

/* Sessão, usuário logado e proteção CSRF — usado por entrar, login, cadastro e sair. */

if (session_status() === PHP_SESSION_NONE) {
    session_set_cookie_params([
        'lifetime' => 0,
        'path'     => '/',
        'httponly' => true,
        'samesite' => 'Lax',
    ]);
    session_start();
}

function usuario_logado(): bool {
    return isset($_SESSION['usuario_id']);
}

function entrar_na_sessao(array $usuario): void {
    session_regenerate_id(true);
    $_SESSION['usuario_id']   = (int) $usuario['id'];
    $_SESSION['usuario_nome'] = $usuario['nome'];
}

function csrf_token(): string {
    if (empty($_SESSION['csrf'])) {
        $_SESSION['csrf'] = bin2hex(random_bytes(32));
    }
    return $_SESSION['csrf'];
}

function csrf_valido(?string $token): bool {
    return is_string($token)
        && isset($_SESSION['csrf'])
        && hash_equals($_SESSION['csrf'], $token);
}

function redirecionar(string $destino): never {
    header('Location: ' . $destino);
    exit;
}

function e_html(?string $valor): string {
    return htmlspecialchars($valor ?? '', ENT_QUOTES, 'UTF-8');
}
