/* Página de favoritos (salvos neste navegador) */
function renderFavs() {
  const user = currentUser();
  const ids = getFavs();
  document.getElementById("fav-eyebrow").textContent = user ? "Garagem de " + user.nome.split(" ")[0] : "Sua lista";
  document.getElementById("fav-count").textContent = ids.length ? ids.length + " título" + (ids.length !== 1 ? "s" : "") + " salvos neste navegador" : "";
  const items = trending.filter((c) => ids.includes(c.id));
  const box = document.getElementById("fav-result");
  if (!items.length) {
    box.innerHTML =
      '<div class="empty">' + ico("heart") + '<p class="t">Sua garagem está vazia</p>' +
      '<p class="d">Toque no coração dos títulos que você ama e eles aparecem aqui.</p>' +
      '<a class="btn" href="catalogo.html">Explorar catálogo</a></div>';
    return;
  }
  box.innerHTML = '<div class="grid grid-main">' + items.map((it) => '<div class="reveal">' + cardHTML(it) + "</div>").join("") + "</div>";
  observeReveals(box);
}
document.addEventListener("rf:favs", renderFavs);
renderFavs();
