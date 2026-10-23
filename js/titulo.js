/* Página de detalhe de um título (titulo.html?id=senna) */
const id = new URLSearchParams(location.search).get("id");
const item = trending.find((t) => t.id === id);
const box = document.getElementById("detail");

if (!item) {
  document.title = "Título não encontrado — F1RACER";
  box.innerHTML =
    '<div class="notfound"><h1 class="display">Título não encontrado</h1><p>Talvez este conteúdo tenha saído de curva.</p>' +
    '<a class="btn" href="catalogo.html">Explorar catálogo</a></div>';
} else {
  document.title = item.title + " — F1RACER";
  const category = categories.find((c) => c.id === item.category_id);
  const related = trending.filter((c) => c.category_id === item.category_id && c.id !== item.id).slice(0, 5);
  box.innerHTML =
    '<section class="detail"><img src="' + esc(item.image) + '" alt="' + esc(item.title) + '"><div class="container">' +
    '<a class="back-link" href="catalogo.html">' + ico("arrowLeft") + "Voltar ao catálogo</a><br>" +
    (item.badge ? '<span class="pill-tag" style="margin-top:24px">' + esc(item.badge) + "</span>" : "") +
    '<h1 class="display">' + esc(item.title) + "</h1>" +
    '<div class="meta"><span>' + ico("star", "star") + esc(item.rating) + "</span><span>" + esc(item.year) + "</span><span>" + ico("clock") + esc(item.duration) + "</span>" +
    (category ? '<a href="catalogo.html?cat=' + esc(category.id) + '">' + esc(category.name) + "</a>" : "") + "</div>" +
    '<p class="synopsis">' + esc(item.synopsis) + "</p>" +
    '<div class="actions"><button class="btn" data-open="' + esc(item.id) + '">' + ico("play", "fill") + "Assistir trailer</button>" +
    '<button class="btn ghost" data-fav="' + esc(item.id) + '">' + ico("heart") + '<span class="lbl">Adicionar aos favoritos</span></button></div>' +
    "</div></section>" +
    (related.length
      ? '<section class="section related"><div class="container"><h2 class="display">Da mesma categoria</h2><div class="grid grid-main">' +
        related.map((r) => '<div class="reveal">' + cardHTML(r) + "</div>").join("") + "</div></div></section>"
      : "");
  refreshFavUI();
  observeReveals();
}
