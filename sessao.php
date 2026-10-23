<?php
/* Informa ao menu (js/app.js) se há alguém logado. */
require_once __DIR__ . '/config/auth.php';

header('Content-Type: application/json; charset=utf-8');
header('Cache-Control: no-store');

echo json_encode(
    usuario_logado()
        ? ['logado' => true, 'nome' => $_SESSION['usuario_nome']]
        : ['logado' => false],
    JSON_UNESCAPED_UNICODE
);
