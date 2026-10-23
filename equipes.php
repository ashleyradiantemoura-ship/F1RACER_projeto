
<?php
require_once __DIR__ . '/config/conexao.php';

/* BUSCAR EQUIPES E QUANTIDADE DE PILOTOS */
$sql = "SELECT
            e.*,
            COUNT(p.id) AS total_pilotos
        FROM equipes e
        LEFT JOIN pilotos p ON p.equipe_id = e.id
        GROUP BY e.id
        ORDER BY e.nome";

$equipes = $pdo->query($sql)->fetchAll();

/* IDENTIFICAR COR DE CADA EQUIPE */
function corEquipe($nome) {

    $nome = mb_strtolower(trim($nome), 'UTF-8');

    $cores = [
        'ferrari'      => '#E80020',
        'mclaren'      => '#FF8700',
        'mercedes'     => '#27F4D2',
        'racing bulls' => '#6692FF',
        'red bull'     => '#3671C6',
        'aston martin' => '#229971',
        'alpine'       => '#FF87BC',
        'williams'     => '#64C4FF',
        'haas'         => '#B6BABD',
        'audi'         => '#F50537',
        'sauber'       => '#F50537',
        'cadillac'     => '#D4AF37'
    ];

    foreach ($cores as $equipe => $cor) {
        if (mb_strpos($nome, $equipe) !== false) {
            return $cor;
        }
    }

    return '#FFFFFF';
}
?>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0"
    >

    <title>Equipes | F1RACER</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Outfit:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/apex.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/f1-paginas.css">

</head>

<body data-page="equipes" data-sem-busca class="pagina-lista">

<?php $paginaAtiva = 'equipes'; include __DIR__ . '/includes/topo.php'; ?>

<main class="page-shell">

    <!-- INTRODUCAO -->
    <section class="page-intro">

        <p class="eyebrow">TEMPORADA 2026</p>

        <h1>
            Conheça as <span>equipes</span>
        </h1>

        <p>
            História, pilotos e máquinas que formam o grid.
        </p>

        <label class="search-box">

            <span aria-hidden="true">⌕</span>

            <input
                id="busca"
                type="search"
                placeholder="Buscar equipe ou país..."
                autocomplete="off"
            >

        </label>

    </section>

    <!-- GRID DE EQUIPES -->
    <section class="section">

        <div class="section-heading">

            <h2>
                Equipes do grid

                <span class="count">
                    (<?= count($equipes) ?>)
                </span>
            </h2>

        </div>

        <div
            class="card-grid team-grid"
            id="lista-equipes"
        >

            <?php foreach ($equipes as $equipe): ?>

                <a
                    class="team-card searchable"
                    data-search="<?= e(
                        $equipe['nome'] . ' ' .
                        $equipe['pais'] . ' ' .
                        $equipe['cidade']
                    ) ?>"
                    style="--team-cor: <?= corEquipe($equipe['nome']) ?>;"
                    href="equipe.php?id=<?= (int) $equipe['id'] ?>"
                >

                    <!-- IMAGEM DA EQUIPE -->
                    <div class="team-image">

                        <?php if (
                            !empty($equipe['imagem']) &&
                            file_exists(__DIR__ . '/' . $equipe['imagem'])
                        ): ?>

                            <img
                                src="<?= e($equipe['imagem']) ?>"
                                alt="Carro ou imagem da equipe <?= e($equipe['nome']) ?>"
                            >

                        <?php else: ?>

                            <div class="image-placeholder">

                                <span>
                                    <?= e(
                                        strtoupper(
                                            substr($equipe['nome'], 0, 2)
                                        )
                                    ) ?>
                                </span>

                                <small>
                                    IMAGEM DA EQUIPE
                                </small>

                            </div>

                        <?php endif; ?>

                    </div>

                    <!-- INFORMACOES DA EQUIPE -->
                    <div class="card-content">

                        <!-- PAIS -->
                        <p class="card-kicker">
                            <?= e($equipe['pais']) ?>
                        </p>

                        <!-- NOME COM COR DA EQUIPE -->
                        <h3
                            style="color: <?= corEquipe($equipe['nome']) ?>;"
                        >
                            <?= e($equipe['nome']) ?>
                        </h3>

                        <!-- CIDADE -->
                        <p class="muted">
                            <?= e($equipe['cidade']) ?>
                        </p>

                        <!-- QUANTIDADE DE PILOTOS -->
                        <p class="muted team-count">
                            <?= (int) $equipe['total_pilotos'] ?>
                            pilotos cadastrados
                        </p>

                        <!-- LINK -->
                        <span class="text-link">
                            Ver equipe →
                        </span>

                    </div>

                </a>

            <?php endforeach; ?>

        </div>

        <!-- NENHUMA EQUIPE ENCONTRADA -->
        <p
            class="empty-state"
            id="sem-equipes"
            hidden
        >
            Nenhuma equipe encontrada.
        </p>

    </section>

</main>

<?php include __DIR__ . '/includes/rodape.php'; ?>

<script>
const busca = document.getElementById('busca');

const cards = [
    ...document.querySelectorAll('.searchable')
];

const vazio = document.getElementById('sem-equipes');

busca.addEventListener('input', () => {

    const termo = busca.value
        .trim()
        .toLocaleLowerCase('pt-BR');

    let visiveis = 0;

    cards.forEach(card => {

        const corresponde = card.dataset.search
            .toLocaleLowerCase('pt-BR')
            .includes(termo);

        card.hidden = !corresponde;

        if (corresponde) {
            visiveis++;
        }

    });

    vazio.hidden = visiveis !== 0;

});
</script>

<script src="js/data.js"></script>
<script src="js/app.js"></script>
</body>
</html>
