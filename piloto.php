<?php

require_once __DIR__ . '/config/conexao.php';



$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);



if (!$id || $id < 1) {

    http_response_code(404);

    exit('Piloto não encontrado. <a href="pilotos.php">Voltar aos pilotos</a>');

}



/* Busca os dados do piloto e da equipe correspondente */

$sql = "SELECT

            p.*,

            e.nome AS equipe,

            e.imagem AS imagem_equipe

        FROM pilotos p

        INNER JOIN equipes e ON e.id = p.equipe_id

        WHERE p.id = :id";



$stmt = $pdo->prepare($sql);

$stmt->execute(['id' => $id]);

$piloto = $stmt->fetch(PDO::FETCH_ASSOC);



if (!$piloto) {

    http_response_code(404);

    exit('Piloto não encontrado. <a href="pilotos.php">Voltar aos pilotos</a>');

}



/* Função de proteção de saída HTML */

if (!function_exists('e')) {

    function e($valor): string

    {

        return htmlspecialchars(

            (string) $valor,

            ENT_QUOTES,

            'UTF-8'

        );

    }

}



/* Bandeiras dos pilotos */


/* Cores das equipes na temporada 2026 */
function corEquipe(string $nome): string
{
    $nome = mb_strtolower(trim($nome), 'UTF-8');
    $cores = [
        'racing bulls' => '#6692FF',
        'red bull' => '#3671C6',
        'ferrari' => '#E80020',
        'mclaren' => '#FF8700',
        'mercedes' => '#27F4D2',
        'aston martin' => '#229971',
        'alpine' => '#FF87BC',
        'williams' => '#64C4FF',
        'haas' => '#B6BABD',
        'audi' => '#F50537',
        'sauber' => '#F50537',
        'cadillac' => '#D4AF37',
    ];
    foreach ($cores as $chave => $cor) {
        if (mb_strpos($nome, $chave) !== false) {
            return $cor;
        }
    }
    return '#FFFFFF';
}

$corDoPiloto = corEquipe((string) $piloto['equipe']);

$bandeiras = [

    'Britânica'    => 'britanica.webp',

    'Brasileira'   => 'brasileira.webp',

    'Monegasca'    => 'monegasca.webp',

    'Espanhola'    => 'espanhola.webp',

    'Francesa'     => 'francesa.webp',

    'Alemã'        => 'alema.png',

    'Italiana'     => 'italiana.png',

    'Mexicana'     => 'mexicana.jpg',

    'Australiana'  => 'australiana.png',

    'Canadense'    => 'canadense.png',

    'Finlandesa'   => 'filandesa.svg',

    'Neerlandesa'  => 'neerlandesa.png',

    'Tailandesa'   => 'tailandesa.png',

    'Japonesa'     => 'tailandesa.jpg',

    'Chinesa'      => 'chinesa.svg'

];



$bandeira = $bandeiras[$piloto['nacionalidade']] ?? null;



/* Caminhos das imagens da equipe */

$imagemEquipe = trim((string) ($piloto['imagem_equipe'] ?? ''));



if ($imagemEquipe !== '') {

    $nomeArquivoEquipe = basename(str_replace('\\\\', '/', $imagemEquipe));

    $caminhoRelativoEquipe = 'assets/img/equipes/' . $nomeArquivoEquipe;

    $caminhoFisicoEquipe = __DIR__ . '/' . $caminhoRelativoEquipe;



    if (!is_file($caminhoFisicoEquipe)) {

        $caminhoRelativoEquipe = '';

    }

} else {

    $caminhoRelativoEquipe = '';

}



/* Foto do piloto */

$imagemPiloto = trim((string) ($piloto['imagem'] ?? ''));



if (

    $imagemPiloto !== ''

    && is_file(__DIR__ . '/' . $imagemPiloto)

) {

    $caminhoImagemPiloto = $imagemPiloto;

} else {

    $caminhoImagemPiloto = '';

}

?>

<!DOCTYPE html>

<html lang="pt-BR">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">



    <title><?= e($piloto['nome']) ?> | F1RACER</title>



    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Outfit:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/apex.css">
    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet" href="css/piloto.css">
    <link rel="stylesheet" href="css/f1-paginas.css">

</head>



<body data-page="pilotos" data-sem-busca>



<?php $paginaAtiva = 'pilotos'; include __DIR__ . '/includes/topo.php'; ?>



<main class="page-shell">



    <a class="back-link" href="pilotos.php">

        ← Voltar para pilotos

    </a>



    <section class="profile-hero">



        <div class="profile-visual">



            <?php if ($caminhoImagemPiloto !== ''): ?>



                <img

                    src="<?= e($caminhoImagemPiloto) ?>"

                    alt="Foto de <?= e($piloto['nome']) ?>"

                >



            <?php else: ?>



                <div class="profile-placeholder">

                    <span style="color: <?= e($corDoPiloto) ?>;">#<?= (int) $piloto['numero'] ?></span>

                    <small>FOTO DO PILOTO</small>

                </div>



            <?php endif; ?>



        </div>



        <div class="profile-heading">



            <p class="eyebrow">PERFIL DO PILOTO</p>



            <p class="profile-number" style="color: <?= e($corDoPiloto) ?>;">

                #<?= (int) $piloto['numero'] ?>

            </p>



            <div class="driver-name-row">



                <h1><?= e($piloto['nome']) ?></h1>



                <?php if ($bandeira): ?>

                    <img

                        class="driver-flag"

                        src="assets/img/bandeiras/<?= e($bandeira) ?>"

                        alt="Bandeira de <?= e($piloto['nacionalidade']) ?>"

                    >

                <?php endif; ?>



            </div>





<div class="profile-nationality">

    <span class="nationality-label">

        NACIONALIDADE

    </span>



    <span class="nationality-text">

        <?= e($piloto['nacionalidade']) ?>

    </span>

</div>





            <a

                class="button"

                href="equipe.php?id=<?= (int) $piloto['equipe_id'] ?>"

            >

                Conhecer equipe atual

            </a>



            <div class="driver-stats">



                <article class="stat-card">



                    <svg

                        class="stat-icon"

                        viewBox="0 0 24 24"

                        fill="none"

                        stroke="currentColor"

                        stroke-width="1.8"

                        stroke-linecap="round"

                        stroke-linejoin="round"

                        aria-hidden="true"

                    >

                        <path d="M8 21h8" />

                        <path d="M12 17v4" />

                        <path d="M7 4h10v5a5 5 0 0 1-10 0V4Z" />

                        <path d="M7 6H4v2a4 4 0 0 0 4 4" />

                        <path d="M17 6h3v2a4 4 0 0 1-4 4" />

                    </svg>



                    <div class="stat-info">

                        <span class="stat-label">Pódios</span>

                        <strong>

                            <?= number_format(

                                (int) ($piloto['podios'] ?? 0),

                                0,

                                ',',

                                '.'

                            ) ?>

                        </strong>

                    </div>



                </article>



                <article class="stat-card">



                    <svg

                        class="stat-icon"

                        viewBox="0 0 24 24"

                        fill="none"

                        stroke="currentColor"

                        stroke-width="1.8"

                        stroke-linecap="round"

                        stroke-linejoin="round"

                        aria-hidden="true"

                    >

                        <circle cx="12" cy="12" r="9" />

                        <circle cx="12" cy="12" r="5" />

                        <circle cx="12" cy="12" r="1" />

                        <path d="M12 3v2" />

                        <path d="M21 12h-2" />

                    </svg>



                    <div class="stat-info">

                        <span class="stat-label">Pole positions</span>

                        <strong>

                            <?= number_format(

                                (int) ($piloto['pole_positions'] ?? 0),

                                0,

                                ',',

                                '.'

                            ) ?>

                        </strong>

                    </div>



                </article>



                <article class="stat-card">



                    <svg

                        class="stat-icon"

                        viewBox="0 0 24 24"

                        fill="none"

                        stroke="currentColor"

                        stroke-width="1.8"

                        stroke-linecap="round"

                        stroke-linejoin="round"

                        aria-hidden="true"

                    >

                        <path d="M3 3v18h18" />

                        <path d="m7 14 4-4 4 3 5-7" />

                        <path d="M15 6h5v5" />

                    </svg>



                    <div class="stat-info">

                        <span class="stat-label">Pontos na carreira</span>

                        <strong>

                            <?= number_format(

                                (float) ($piloto['pontos_carreira'] ?? 0),

                                1,

                                ',',

                                '.'

                            ) ?>

                        </strong>

                    </div>



                </article>



            </div>



        </div>



    </section>



    <section class="detail-grid">



        <article class="content-panel">



            <p class="eyebrow">TRAJETÓRIA</p>



            <h2>Sobre o piloto</h2>



            <p>

                <?= nl2br(e($piloto['sobre'] ?? '')) ?>

            </p>



        </article>



        <article class="content-panel team-panel">



            <p class="eyebrow">EQUIPE ATUAL</p>



            <h2><?= e($piloto['equipe']) ?></h2>



            <?php if ($caminhoRelativoEquipe !== ''): ?>



                <img

                    class="team-mini-image"

                    src="<?= e($caminhoRelativoEquipe) ?>"

                    alt="Imagem da equipe <?= e($piloto['equipe']) ?>"

                >



            <?php else: ?>



                <p class="team-image-error">

                    Imagem da equipe não encontrada.

                </p>



            <?php endif; ?>



            <a

                class="text-link"

                href="equipe.php?id=<?= (int) $piloto['equipe_id'] ?>"

            >

                Ver perfil da equipe →

            </a>



        </article>



    </section>



</main>



<?php include __DIR__ . '/includes/rodape.php'; ?>



<script src="js/data.js"></script>
<script src="js/app.js"></script>
</body>

</html>
