
<?php
require_once __DIR__ . '/config/conexao.php';

$sql = "SELECT p.id, p.nome, p.numero, p.nacionalidade, p.imagem,
               e.nome AS equipe
        FROM pilotos p
        INNER JOIN equipes e ON e.id = p.equipe_id
        ORDER BY p.nome";

$pilotos = $pdo->query($sql)->fetchAll();

/* Identifica a cor da equipe pelo nome */
function corEquipe($nome) {
    $nome = mb_strtolower(trim($nome), 'UTF-8');

    $cores = [
        'ferrari'       => '#E80020',
        'mclaren'       => '#FF8700',
        'mercedes'      => '#27F4D2',
        'red bull'      => '#3671C6',
        'racing bulls'  => '#6692FF',
        'aston martin'  => '#229971',
        'alpine'        => '#FF87BC',
        'williams'      => '#64C4FF',
        'haas'          => '#B6BABD',
        'audi'          => '#F50537',
        'sauber'        => '#F50537',
        'cadillac'      => '#D4AF37'
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Pilotos | F1RACER</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Outfit:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/apex.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/f1-paginas.css">

</head>

<body data-page="pilotos" data-sem-busca class="pagina-lista">

<?php $paginaAtiva = 'pilotos'; include __DIR__ . '/includes/topo.php'; ?>

<main class="page-shell">

    <section class="page-intro">
        <p class="eyebrow">TEMPORADA 2026</p>

        <h1>Conheça os <span>pilotos</span></h1>

        <p>Descubra quem está por trás do capacete.</p>

        <label class="search-box">
            <span aria-hidden="true">⌕</span>

            <input
                id="busca"
                type="search"
                placeholder="Buscar piloto ou equipe..."
                autocomplete="off"
            >
        </label>
    </section>

    <section class="section">

        <div class="section-heading">
            <h2>
                Grid de pilotos
                <span class="count">
                    (<?= count($pilotos) ?>)
                </span>
            </h2>
        </div>

        <div class="card-grid" id="lista-pilotos">

            <?php foreach ($pilotos as $piloto): ?>

                <a
                    class="driver-card searchable"
                    data-search="<?= e(
                        $piloto['nome'] . ' ' .
                        $piloto['equipe'] . ' ' .
                        $piloto['nacionalidade']
                    ) ?>"
                    style="--team-cor: <?= corEquipe($piloto['equipe']) ?>;"
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

                        <!-- NOME DA EQUIPE COM COR AUTOMATICA -->
                        <p
                            class="card-kicker"
                            style="color: <?= corEquipe($piloto['equipe']) ?>;"
                        >
                            <?= e($piloto['equipe']) ?>
                        </p>

                        <!-- NOME DO PILOTO -->
                        <h3>
                            <?= e($piloto['nome']) ?>
                        </h3>

                        <!-- NACIONALIDADE -->
                        <p class="muted">
                            <?= e($piloto['nacionalidade']) ?>
                        </p>

                        <span class="text-link">
                            Ver perfil →
                        </span>

                    </div>

                </a>

            <?php endforeach; ?>

        </div>

        <p class="empty-state" id="sem-pilotos" hidden>
            Nenhum piloto encontrado.
        </p>

    </section>

</main>

<?php include __DIR__ . '/includes/rodape.php'; ?>

<script>
const busca = document.getElementById('busca');
const cards = [...document.querySelectorAll('.searchable')];
const vazio = document.getElementById('sem-pilotos');

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
