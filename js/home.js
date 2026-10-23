/* Página inicial: carrossel, faixa de texto, "Em alta" e categorias */

/* ----- Carrossel ----- */
let heroIndex = 0;
let heroTimer = null;
const bgsBox = document.getElementById("hero-bgs");
const textBox = document.getElementById("hero-text");
const dotsBox = document.getElementById("hero-dots");

bgsBox.innerHTML = heroSlides
  .map((s, i) => '<div class="hero-bg' + (i === 0 ? " active" : "") + '"><img src="' + esc(s.image) + '" alt="' + esc(s.title) + '"></div>')
  .join("");
document.querySelectorAll('[data-hero="prev"]').forEach((b) => (b.innerHTML = ico("left")));
document.querySelectorAll('[data-hero="next"]').forEach((b) => (b.innerHTML = ico("right")));

function showSlide(i) {
  heroIndex = (i + heroSlides.length) % heroSlides.length;
  const s = heroSlides[heroIndex];
  bgsBox.querySelectorAll(".hero-bg").forEach((el, n) => el.classList.toggle("active", n === heroIndex));

  const lines = s.lines
    .map((l, n) => '<span class="line"><span class="' + (l.accent ? "accent" : "") + '" style="animation-delay:' + (0.15 + n * 0.13) + 's">' + esc(l.t) + "</span></span>")
    .join("");
  textBox.innerHTML =
    '<p class="eyebrow fade-up">' + esc(s.tag) + "</p>" +
    "<h1>" + lines + "</h1>" +
    '<p class="hero-sub fade-up" style="animation-delay:.55s">' + esc(s.subtitle) + "</p>" +
    '<div class="hero-cta fade-up" style="animation-delay:.7s">' +
    '<button class="btn" data-open="' + esc(s.id) + '">' + ico("play", "fill") + "Assistir agora</button>" +
    '<button class="btn ghost" data-open="' + esc(s.id) + '">' + ico("info") + "Saiba mais</button></div>";

  dotsBox.innerHTML =
    heroSlides.map((x, n) => '<button class="dot' + (n === heroIndex ? " active" : "") + '" data-dot="' + n + '" aria-label="Ir para o slide ' + (n + 1) + '"></button>').join("") +
    '<span class="counter">' + String(heroIndex + 1).padStart(2, "0") + " / " + String(heroSlides.length).padStart(2, "0") + "</span>";

  clearInterval(heroTimer);
  heroTimer = setInterval(() => showSlide(heroIndex + 1), 7500);
}
document.addEventListener("click", (e) => {
  const dot = e.target.closest("[data-dot]");
  if (dot) return showSlide(Number(dot.dataset.dot));
  const nav = e.target.closest("[data-hero]");
  if (nav) showSlide(heroIndex + (nav.dataset.hero === "next" ? 1 : -1));
});
showSlide(0);

/* ----- Faixa de texto ----- */
const group = marqueeItems.map((t) => '<span class="marquee-item">' + esc(t) + ico("zap", "fill") + "</span>").join("");
document.getElementById("marquee").innerHTML =
  '<div class="marquee-group">' + group + '</div><div class="marquee-group" aria-hidden="true">' + group + "</div>";

/* ----- Em alta ----- */
document.getElementById("ico-arrow").innerHTML = ico("arrowRight");
document.getElementById("trending").innerHTML = trending.map((it) => '<div class="reveal">' + cardHTML(it) + "</div>").join("");

/* ----- Categorias ----- */
document.getElementById("cats").innerHTML = categories
  .map(
    (c) =>
      '<a class="cat reveal" href="' + ({ pilotos: "pilotos.php", equipes: "equipes.php", circuitos: "circuitos.html", "momentos-historicos": "momentos-historicos.html" }[c.id] || ("catalogo.html?cat=" + esc(c.id))) + '">' +
      '<img src="' + esc(c.image) + '" alt="' + esc(c.name) + '" loading="lazy"><div class="shade"></div>' +
      '<span class="ico">' + ico(c.icon.charAt(0).toLowerCase() + c.icon.slice(1)) + "</span>" +
      '<span class="go">' + ico("arrowUpRight") + "</span>" +
      '<span class="info"><b>' + esc(c.name) + "</b><small>" + esc(c.count) + "</small></span>" +
      '<span class="bar"></span></a>'
  )
  .join("");

observeReveals();
