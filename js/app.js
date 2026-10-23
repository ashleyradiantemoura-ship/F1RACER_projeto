/* F1RACER — código compartilhado por todas as páginas
   (menu, rodapé, favoritos, login local, modal de trailer, avisos). */

/* ---------- Ícones (SVG embutido, sem biblioteca) ---------- */
const ICONS = {
  play: '<polygon points="6 3 20 12 6 21 6 3"/>',
  heart: '<path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"/>',
  search: '<circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/>',
  x: '<path d="M18 6 6 18"/><path d="m6 6 12 12"/>',
  menu: '<path d="M4 6h16"/><path d="M4 12h16"/><path d="M4 18h16"/>',
  zap: '<polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/>',
  star: '<polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>',
  clock: '<circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/>',
  info: '<circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/>',
  left: '<path d="m15 18-6-6 6-6"/>',
  right: '<path d="m9 18 6-6-6-6"/>',
  arrowRight: '<path d="M5 12h14"/><path d="m12 5 7 7-7 7"/>',
  arrowLeft: '<path d="m12 19-7-7 7-7"/><path d="M19 12H5"/>',
  arrowUpRight: '<path d="M7 7h10v10"/><path d="M7 17 17 7"/>',
  film: '<rect width="20" height="20" x="2" y="2" rx="2.18"/><path d="M7 2v20"/><path d="M17 2v20"/><path d="M2 12h20"/><path d="M2 7h5"/><path d="M2 17h5"/><path d="M17 17h5"/><path d="M17 7h5"/>',
  trophy: '<path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"/><path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"/><path d="M4 22h16"/><path d="M10 14.66V17c0 .55-.47.98-1.97 1.21C7.85 18.75 7 20.24 7 22"/><path d="M14 14.66V17c0 .55.47.98 1.97 1.21C16.15 18.75 17 20.24 17 22"/><path d="M18 2H6v7a6 6 0 0 0 12 0V2Z"/>',
  user: '<path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/>',
  shield: '<path d="M20 13c0 5-3.5 7.5-7.66 8.95a1 1 0 0 1-.67-.01C7.5 20.5 4 18 4 13V6a1 1 0 0 1 1-1c2 0 4.5-1.2 6.24-2.72a1.17 1.17 0 0 1 1.52 0C14.51 3.81 17 5 19 5a1 1 0 0 1 1 1z"/>',
  login: '<path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/><path d="m10 17 5-5-5-5"/><path d="M15 12H3"/>',
  logout: '<path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><path d="m16 17 5-5-5-5"/><path d="M21 12H9"/>',
  userPlus: '<path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M19 8v6"/><path d="M22 11h-6"/>',
  twitter: '<path d="M22 4s-.7 2.1-2 3.4c1.6 10-9.4 17.3-18 11.6 2.2.1 4.4-.6 6-2C3 15.5.5 9.6 3 5c2.2 2.6 5.6 4.1 9 4-.9-4.2 4-6.6 7-3.8 1.1 0 3-1.2 3-1.2z"/>',
  instagram: '<rect width="20" height="20" x="2" y="2" rx="5" ry="5"/><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"/><line x1="17.5" x2="17.51" y1="6.5" y2="6.5"/>',
  youtube: '<path d="M2.5 17a24.12 24.12 0 0 1 0-10 2 2 0 0 1 1.4-1.4 49.56 49.56 0 0 1 16.2 0A2 2 0 0 1 21.5 7a24.12 24.12 0 0 1 0 10 2 2 0 0 1-1.4 1.4 49.55 49.55 0 0 1-16.2 0A2 2 0 0 1 2.5 17"/><path d="m10 15 5-3-5-3z"/>',
};
function ico(name, extra) {
  return '<svg class="icon ' + (extra || "") + '" viewBox="0 0 24 24" aria-hidden="true">' + ICONS[name] + "</svg>";
}
function esc(s) {
  return String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]));
}

/* ---------- Armazenamento no navegador (localStorage) ---------- */
function lsGet(key, fallback) {
  try {
    const v = localStorage.getItem(key);
    return v ? JSON.parse(v) : fallback;
  } catch (e) {
    return fallback;
  }
}
function lsSet(key, value) {
  try {
    localStorage.setItem(key, JSON.stringify(value));
  } catch (e) {}
}

/* ---------- Itens (para achar um título pelo id) ---------- */
const ITEMS = {};
heroSlides.concat(trending).forEach((it) => (ITEMS[it.id] = it));
function getTrailerId(item) {
  return item.trailer_id || TRAILERS[item.id] || null;
}
function hasDetailPage(item) {
  return !item.id.startsWith("slide-");
}

/* ---------- Favoritos ---------- */
function getFavs() {
  return lsGet("raceflix:favs", []);
}
function isFav(id) {
  return getFavs().includes(id);
}
function toggleFav(id) {
  let favs = getFavs();
  const was = favs.includes(id);
  favs = was ? favs.filter((i) => i !== id) : favs.concat(id);
  lsSet("raceflix:favs", favs);
  toast(was ? "Removido dos favoritos." : "Adicionado aos favoritos!");
  refreshFavUI();
  document.dispatchEvent(new CustomEvent("rf:favs"));
}
function refreshFavUI() {
  const total = getFavs().length;
  document.querySelectorAll(".fav-count").forEach((el) => {
    el.textContent = total;
    el.style.display = total > 0 ? "" : "none";
  });
  document.querySelectorAll("[data-fav]").forEach((el) => {
    const on = isFav(el.dataset.fav);
    if (el.classList.contains("btn")) el.classList.toggle("fav-on", on);
    else el.classList.toggle("on", on);
    const lbl = el.querySelector(".lbl");
    if (lbl) lbl.textContent = on ? "Nos favoritos" : "Adicionar aos favoritos";
    el.setAttribute("aria-label", on ? "Remover dos favoritos" : "Adicionar aos favoritos");
  });
}

/* ---------- Login (sessão PHP: veja sessao.php, entrar.php, cadastro.php) ---------- */
let USUARIO = null; // { nome } quando há alguém logado
function currentUser() {
  return USUARIO;
}

/* ---------- Avisos (toast) ---------- */
function toast(msg) {
  let box = document.querySelector(".toasts");
  if (!box) {
    box = document.createElement("div");
    box.className = "toasts";
    document.body.appendChild(box);
  }
  const t = document.createElement("div");
  t.className = "toast";
  t.textContent = msg;
  box.appendChild(t);
  setTimeout(() => t.remove(), 3200);
}

/* ---------- Pôster (card) ---------- */
function cardHTML(it) {
  const on = isFav(it.id);
  return (
    '<div class="card" role="button" tabindex="0" data-card="' + esc(it.id) + '">' +
    '<img src="' + esc(it.image) + '" alt="' + esc(it.title) + '" loading="lazy">' +
    '<div class="shade"></div>' +
    (it.badge ? '<span class="tag">' + esc(it.badge) + "</span>" : "") +
    '<button class="heart ' + (on ? "on" : "") + '" data-fav="' + esc(it.id) + '" aria-label="Adicionar aos favoritos">' + ico("heart") + "</button>" +
    '<span class="play"><span>' + ico("play", "fill") + "</span></span>" +
    '<span class="info"><b>' + esc(it.title) + "</b><small>" + esc(it.year) + (it.duration ? " • " + esc(it.duration) : "") + "</small></span>" +
    '<span class="bar"></span></div>'
  );
}

/* ---------- Animação de entrada ao rolar ---------- */
function observeReveals(root) {
  const els = (root || document).querySelectorAll(".reveal:not(.in)");
  if (!("IntersectionObserver" in window)) {
    els.forEach((el) => el.classList.add("in"));
    return;
  }
  const io = new IntersectionObserver(
    (entries) => {
      entries.forEach((en) => {
        if (en.isIntersecting) {
          en.target.classList.add("in");
          io.unobserve(en.target);
        }
      });
    },
    { threshold: 0.1 }
  );
  els.forEach((el, i) => {
    el.style.transitionDelay = (i % 6) * 0.07 + "s";
    io.observe(el);
  });
}

/* ---------- Modal de trailer ---------- */
let modalEl = null;
function buildModal() {
  modalEl = document.createElement("div");
  modalEl.className = "modal";
  modalEl.innerHTML = '<div class="modal-bg" data-close></div><div class="modal-box" role="dialog" aria-modal="true"></div>';
  document.body.appendChild(modalEl);
  modalEl.addEventListener("click", (e) => {
    if (e.target.closest("[data-close]")) closeModal();
  });
}
function openModal(item) {
  if (!item) return;
  if (!modalEl) buildModal();
  const trailer = getTrailerId(item);
  const media = trailer
    ? '<iframe src="https://www.youtube.com/embed/' + esc(trailer) + '?autoplay=1&rel=0" title="Trailer — ' + esc(item.title) + '" allow="autoplay; encrypted-media; fullscreen" allowfullscreen></iframe>'
    : '<img src="' + esc(item.image) + '" alt="' + esc(item.title) + '">';
  const link = hasDetailPage(item)
    ? '<a class="btn" href="titulo.html?id=' + encodeURIComponent(item.id) + '">' + ico("info") + "Ver detalhes completos</a>"
    : '<a class="btn" href="catalogo.html">' + ico("info") + "Explorar catálogo</a>";
  const on = isFav(item.id);
  modalEl.querySelector(".modal-box").innerHTML =
    '<div class="media">' + media + '<button class="modal-close" data-close aria-label="Fechar">' + ico("x") + "</button></div>" +
    '<div class="modal-body"><span class="pill-tag">' + esc(item.badge || "") + "</span>" +
    '<h3 class="display">' + esc(item.title) + "</h3>" +
    '<div class="meta">' +
    (item.rating ? '<span>' + ico("star", "star") + esc(item.rating) + "</span>" : "") +
    (item.year ? "<span>" + esc(item.year) + "</span>" : "") +
    (item.duration ? "<span>" + ico("clock") + esc(item.duration) + "</span>" : "") +
    "</div>" +
    (item.synopsis ? '<p class="synopsis">' + esc(item.synopsis) + "</p>" : "") +
    '<div class="actions">' + link +
    '<button class="btn ghost ' + (on ? "fav-on" : "") + '" data-fav="' + esc(item.id) + '">' + ico("heart") + '<span class="lbl">' + (on ? "Nos favoritos" : "Adicionar aos favoritos") + "</span></button>" +
    "</div></div>";
  modalEl.classList.add("open");
  document.body.classList.add("no-scroll");
}
function closeModal() {
  if (!modalEl) return;
  modalEl.classList.remove("open");
  modalEl.querySelector(".modal-box").innerHTML = ""; // para o vídeo
  document.body.classList.remove("no-scroll");
}

/* ---------- Menu e rodapé ---------- */
function renderHeader() {
  const mount = document.getElementById("site-header");
  if (!mount) return;
  const page = document.body.dataset.page || "";
  const user = currentUser();
  const first = user ? esc(user.nome.split(" ")[0]) : "";
  const favBadge = '<span class="badge-count fav-count" style="display:none"></span>';
  const authDesktop = user
    ? '<span class="user-chip">Olá, ' + first + '</span><button class="btn ghost small" data-logout>' + ico("logout") + "Sair</button>"
    : '<a class="btn ghost small" href="entrar.php">' + ico("login") + 'Entrar</a><a class="btn small" href="cadastro.php">Cadastrar</a>';
  const authMobile = user
    ? '<span class="user-chip" style="color:var(--brand)">Olá, ' + first + '</span><button class="btn ghost small" data-logout>Sair</button>'
    : '<div class="row"><a class="btn ghost small" href="entrar.php">Entrar</a><a class="btn small" href="cadastro.php">Cadastrar</a></div>';
  const semBusca = document.body.hasAttribute("data-sem-busca"); // páginas de pilotos/equipes
  const searchForm = (cls) =>
    semBusca ? "" : '<form class="search ' + cls + '" data-search>' + ico("search") + '<input type="text" placeholder="Buscar..." aria-label="Buscar títulos"></form>';
  mount.innerHTML =
    '<header class="header" id="header"><div class="container"><div class="header-row">' +
    '<a class="logo" href="index.html" aria-label="F1RACER — início"><i></i><span>F1<b>RACER</b></span></a>' +
    '<nav class="nav">' +
    '<a href="index.html" class="' + (page === "home" ? "active" : "") + '">Início</a>' +
    '<a href="catalogo.html" class="' + (page === "catalogo" ? "active" : "") + '">Catálogo</a>' +
    '<a href="favoritos.html" class="' + (page === "favoritos" ? "active" : "") + '">' + ico("heart") + "Favoritos" + favBadge + "</a>" +
    "</nav>" +
    '<div class="header-right">' + searchForm("") + '<div class="auth-desktop">' + authDesktop + "</div>" +
    '<button class="menu-toggle" id="menu-toggle" aria-label="Abrir menu">' + ico("menu") + "</button></div>" +
    "</div></div>" +
    '<div class="mobile-menu" id="mobile-menu">' +
    '<a class="big" href="index.html">Início</a><a class="big" href="catalogo.html">Catálogo</a>' +
    '<a class="big" href="favoritos.html">Favoritos ' + favBadge + "</a>" +
    searchForm("") + authMobile + "</div></header>";

  const header = document.getElementById("header");
  const onScroll = () => header.classList.toggle("scrolled", window.scrollY > 24);
  onScroll();
  window.addEventListener("scroll", onScroll, { passive: true });
  document.getElementById("menu-toggle").addEventListener("click", () => {
    document.getElementById("mobile-menu").classList.toggle("open");
  });
  mount.querySelectorAll("[data-search]").forEach((f) =>
    f.addEventListener("submit", (e) => {
      e.preventDefault();
      location.href = "catalogo.html?q=" + encodeURIComponent(f.querySelector("input").value.trim());
    })
  );
  mount.querySelectorAll("[data-logout]").forEach((b) =>
    b.addEventListener("click", () => {
      location.href = "sair.php";
    })
  );
}

function renderFooter() {
  const mount = document.getElementById("site-footer");
  if (!mount) return;
  const destinos = { pilotos: 'pilotos.php', equipes: 'equipes.php', circuitos: 'circuitos.html', 'momentos-historicos': 'momentos-historicos.html' };
  const conteudo = categories.map((c) => '<li><a href="' + (destinos[c.id] || ('catalogo.html?cat=' + esc(c.id))) + '">' + esc(c.name) + "</a></li>").join("");
  const inst = ["Sobre nós", "Termos de Uso", "Privacidade", "Ajuda", "Imprensa"]
    .map((t) => '<li><button data-soon>' + t + "</button></li>")
    .join("");
  mount.innerHTML =
    '<footer class="footer"><div class="container"><div class="footer-grid">' +
    '<div><a class="logo" href="index.html" style="font-size:2rem"><i></i><span>F1<b>RACER</b></span></a>' +
    '<p class="about">A plataforma definitiva para os apaixonados por automobilismo.</p>' +
    '<div class="socials">' +
    ["twitter", "instagram", "youtube"].map((n) => '<button data-soon-social aria-label="Rede social">' + ico(n) + "</button>").join("") +
    "</div></div>" +
    '<div><h3>Navegar</h3><ul><li><a href="index.html">Início</a></li><li><a href="catalogo.html">Catálogo</a></li><li><a href="favoritos.html">Favoritos</a></li></ul></div>' +
    "<div><h3>Conteúdo</h3><ul>" + conteudo + "</ul></div>" +
    "<div><h3>Institucional</h3><ul>" + inst + "</ul></div>" +
    "</div>" +
    '<div class="footer-bottom"><p>© 2026 F1RACER Inc. Todos os direitos reservados.</p><p>Fórmula 1 é marca registrada da Formula One Licensing B.V.</p></div>' +
    '</div><div class="footer-big" aria-hidden="true">F1RACER</div></footer>';
}

/* ---------- Eventos globais ---------- */
document.addEventListener("click", (e) => {
  const fav = e.target.closest("[data-fav]");
  if (fav) {
    e.stopPropagation();
    toggleFav(fav.dataset.fav);
    return;
  }
  if (e.target.closest("[data-soon]")) return toast("Página em breve nesta demonstração.");
  if (e.target.closest("[data-soon-social]")) return toast("Redes sociais em breve nesta demonstração.");
  const open = e.target.closest("[data-open]");
  if (open) return openModal(ITEMS[open.dataset.open]);
  const card = e.target.closest("[data-card]");
  if (card) openModal(ITEMS[card.dataset.card]);
});
document.addEventListener("keydown", (e) => {
  if (e.key === "Escape") closeModal();
  if ((e.key === "Enter" || e.key === " ") && e.target.matches && e.target.matches("[data-card]")) {
    e.preventDefault();
    openModal(ITEMS[e.target.dataset.card]);
  }
});

renderHeader(); // já desenha o menu; se houver login, redesenha com o nome
renderFooter();
refreshFavUI();
fetch("sessao.php", { credentials: "same-origin", cache: "no-store" })
  .then((r) => (r.ok ? r.json() : null))
  .then((d) => {
    if (d && d.logado) {
      USUARIO = { nome: d.nome };
      renderHeader();
      refreshFavUI();
    }
  })
  .catch(() => {}); // sem servidor PHP (abrindo o arquivo direto), segue como visitante
