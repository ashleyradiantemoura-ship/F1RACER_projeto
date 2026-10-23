
<?php
require_once __DIR__ . '/config/conexao.php';

$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

if (!$id || $id < 1) {
    http_response_code(404);
    exit('Equipe não encontrada. <a href="equipes.php">Voltar para equipes</a>');
}

// BUSCAR EQUIPE
$stmt = $pdo->prepare('SELECT * FROM equipes WHERE id = :id');
$stmt->execute(['id' => $id]);
$equipe = $stmt->fetch();

if (!$equipe) {
    http_response_code(404);
    exit('Equipe não encontrada. <a href="equipes.php">Voltar para equipes</a>');
}

// BUSCAR PILOTOS DA EQUIPE
$stmtPilotos = $pdo->prepare(
    'SELECT id, nome, numero, nacionalidade, imagem
     FROM pilotos
     WHERE equipe_id = :id
     ORDER BY numero'
);

$stmtPilotos->execute(['id' => $id]);
$pilotos = $stmtPilotos->fetchAll();
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title><?= e($equipe['nome']) ?> | F1RACER</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Outfit:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/apex.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/equipe.css">
    <link rel="stylesheet" href="css/f1-paginas.css">
</head>

<body data-page="equipes" data-sem-busca>

<?php $paginaAtiva = 'equipes'; include __DIR__ . '/includes/topo.php'; ?>

<main class="page-shell">

    <a class="back-link" href="equipes.php">
        ← Voltar para equipes
    </a>

    <!-- PERFIL DA EQUIPE -->

    <section class="team-profile-hero">

        <div class="team-profile-image">

            <?php if (
                !empty($equipe['imagem']) &&
                file_exists(__DIR__ . '/' . $equipe['imagem'])
            ): ?>

                <img
                    src="<?= e($equipe['imagem']) ?>"
                    alt="Carro ou imagem da equipe <?= e($equipe['nome']) ?>"
                >

            <?php else: ?>

                <div class="profile-placeholder">
                    <span>
                        <?= e(strtoupper(substr($equipe['nome'], 0, 2))) ?>
                    </span>
                    <small>IMAGEM DO CARRO</small>
                </div>

            <?php endif; ?>

        </div>

        <div class="profile-heading">

            <p class="eyebrow">PERFIL DA EQUIPE</p>

            <h1><?= e($equipe['nome']) ?></h1>

            <p class="profile-subtitle">
                <?= e($equipe['pais']) ?>
                ·
                <?= e($equipe['cidade']) ?>
            </p>

        </div>

    </section>


    <!-- HISTORIA DA EQUIPE -->

    <section class="section">

        <article class="content-panel">

            <p class="eyebrow">HISTÓRIA E IDENTIDADE</p>

            <h2>Sobre a equipe</h2>

            <p>
                <?= nl2br(e($equipe['sobre'])) ?>
            </p>

        </article>

    </section>


    <!-- PILOTOS E MAQUINA LADO A LADO -->

    <div class="pilotos-maquina-layout">

        <!-- COLUNA ESQUERDA: PILOTOS -->

        <section class="section pilotos-section">

            <div class="section-heading">

                <div>
                    <p class="eyebrow">LINE-UP 2026</p>
                    <h2>Pilotos atuais</h2>
                </div>

            </div>

            <div class="card-grid driver-team-grid">

                <?php foreach ($pilotos as $piloto): ?>

                    <a
                        class="driver-card"
                        href="piloto.php?id=<?= (int) $piloto['id'] ?>"
                    >

                        <div class="driver-image">

                            <?php if (
                                !empty($piloto['imagem']) &&
                                file_exists(__DIR__ . '/' . $piloto['imagem'])
                            ): ?>

                                <img
                                    src="<?= e($piloto['imagem']) ?>"
                                    alt="Foto de <?= e($piloto['nome']) ?>"
                                >

                            <?php else: ?>

                                <div class="image-placeholder">

                                    <span>
                                        #<?= (int) $piloto['numero'] ?>
                                    </span>

                                    <small>FOTO DO PILOTO</small>

                                </div>

                            <?php endif; ?>

                            <span class="number-tag">
                                #<?= (int) $piloto['numero'] ?>
                            </span>

                        </div>

                        <div class="card-content">

                            <h3><?= e($piloto['nome']) ?></h3>

                            <p class="muted">
                                <?= e($piloto['nacionalidade']) ?>
                            </p>

                            <span class="text-link">
                                Ver perfil →
                            </span>

                        </div>

                    </a>

                <?php endforeach; ?>

                <?php if (count($pilotos) === 0): ?>

                    <p>
                        Esta equipe ainda não tem pilotos cadastrados.
                    </p>

                <?php endif; ?>

            </div>

        </section>


        <!-- COLUNA DIREITA: SOMENTE A MAQUINA -->

        <section class="section machine-section">

            <article class="content-panel car-panel">

                <p class="eyebrow">A MÁQUINA</p>

                <h2><?= e($equipe['carro']) ?></h2>

                <?php if (
                    !empty($equipe['imagem']) &&
                    file_exists(__DIR__ . '/' . $equipe['imagem'])
                ): ?>

                    <img
                        class="car-large"
                        src="<?= e($equipe['imagem']) ?>"
                        alt="Carro da equipe <?= e($equipe['nome']) ?>"
                    >

                <?php else: ?>

                    <div class="car-placeholder">
                        ADICIONE A FOTO DO CARRO DA EQUIPE
                    </div>

                <?php endif; ?>

                <p>
                    <?= nl2br(e($equipe['descricao_carro'])) ?>
                </p>

            </article>

        </section>

    </div>

</main>

<?php include __DIR__ . '/includes/rodape.php'; ?>

<script src="js/data.js"></script>
<script src="js/app.js"></script>
</body>
</html>
