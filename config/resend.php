<?php

// Coloque sua chave secreta da API Resend aqui.
// Nunca compartilhe este arquivo publicamente.

define('RESEND_API_KEY', getenv('RESEND_API_KEY') ?: '');

// Em testes, use o remetente de teste permitido pelo Resend.
// Para produção, substitua por um endereço do seu domínio verificado.
// true = a página mostra o motivo real quando o e-mail falha (bom para testar).
// Antes de publicar de verdade, mude para false.
const MODO_DEBUG = true;

const RESEND_FROM = 'F1RACER <onboarding@resend.dev>';

function enviarEmailResend(
    string $destinatario,
    string $assunto,
    string $html
): bool {
    if (
        RESEND_API_KEY === ''
        || !function_exists('curl_init')
    ) {
        $GLOBALS['resend_erro'] = function_exists('curl_init')
            ? 'chave da API não configurada'
            : 'cURL desativado no PHP (ative extension=curl no php.ini e reinicie o Apache)';
        error_log($GLOBALS['resend_erro']);
        return false;
    }

    $dados = [
        'from' => RESEND_FROM,
        'to' => [$destinatario],
        'subject' => $assunto,
        'html' => $html
    ];

    $curl = curl_init('https://api.resend.com/emails');

    curl_setopt_array($curl, [
        CURLOPT_POST => true,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_HTTPHEADER => [
            'Authorization: Bearer ' . RESEND_API_KEY,
            'Content-Type: application/json'
        ],
        CURLOPT_POSTFIELDS => json_encode(
            $dados,
            JSON_UNESCAPED_UNICODE | JSON_THROW_ON_ERROR
        ),
        CURLOPT_CONNECTTIMEOUT => 10,
        CURLOPT_TIMEOUT => 20
    ]);

    $resposta = curl_exec($curl);
    $status = curl_getinfo($curl, CURLINFO_HTTP_CODE);

    if ($resposta === false) {
        $GLOBALS['resend_erro'] = 'erro de conexão: ' . curl_error($curl);
        error_log('Erro Resend cURL: ' . curl_error($curl));
    }

    curl_close($curl);

    if ($resposta === false || $status < 200 || $status >= 300) {
        if ($resposta !== false) {
            $GLOBALS['resend_erro'] = 'Resend respondeu HTTP ' . $status . ': ' . (string) $resposta;
        }
        error_log('Falha Resend HTTP ' . $status . ': ' . (string) $resposta);
        return false;
    }

    return true;
}