/* CATÁLOGO: busca, filtros e ordenação */
const params = new URLSearchParams(location.search);
const state = {
q: params.get("q") || "",
cat: params.get("cat") || "todas",
sort: params.get("sort") || "destaque"
};
const num = (v) => parseFloat(v) || 0;
const qInput = document.getElementById("q");
const sortSel = document.getElementById("sort");
const searchIcon = document.getElementById("ico-search");
const chipsEl = document.getElementById("chips");
const countEl = document.getElementById("count");
const resultEl = document.getElementById("result");
/* Verifica se os elementos principais existem */
const catalogoNormal = qInput && sortSel && chipsEl && countEl && resultEl;
/* PÁGINA DE MOMENTOS HISTÓRICOS */
const momentosPage =
document.getElementById("pesquisa-momentos") ||
document.getElementById("video-grid");
/* Ícone da pesquisa /
if (searchIcon && typeof ico === "function") {
searchIcon.innerHTML = ico("search");
}
/* ==================================================
MOMENTOS HISTÓRICOS
================================================== */
if (momentosPage) {
const pesquisaMomentos =
document.getElementById("pesquisa-momentos");
const videoGrid =
document.getElementById("video-grid");
const resultadoPesquisa =
document.getElementById("resultado-pesquisa");
/*
Usa os dados pageItems da página de momentos.
Não usa trending, pois são conteúdos diferentes.
*/
function pesquisarMomentos() {
if (!pesquisaMomentos || !videoGrid) return;
const termo = pesquisaMomentos.value
.trim()
.toLowerCase();
const encontrados = pageItems.filter((item) => {
const titulo = (item.title || "").toLowerCase();
const sinopse = (item.synopsis || "").toLowerCase();
const ano = String(item.year || "").toLowerCase();
const local = (item.duration || "").toLowerCase();
return (
titulo.includes(termo) ||
sinopse.includes(termo) ||
ano.includes(termo) ||
local.includes(termo)
);
});
/* Atualiza a quantidade encontrada*/ 
if (resultadoPesquisa) {
resultadoPesquisa.textContent =
encontrados.length +
(encontrados.length === 1
? " momento histórico encontrado"
: " momentos históricos encontrados");
}
/* Mostra mensagem quando não encontrar */
if (encontrados.length === 0) {
videoGrid.innerHTML = `
<div class="pesquisa-vazia">
<h3>Nenhum momento encontrado</h3>
<p>Tente pesquisar por outro nome, ano ou corrida.</p>
</div>
`;
return;
}
/* Atualiza os cards  */
videoGrid.innerHTML = encontrados
.map((item) => cardHTML(item))
.join("");
if (typeof observeReveals === "function") {
observeReveals(videoGrid);
}
}
/* Pesquisa enquanto digita */
if (pesquisaMomentos) {
pesquisaMomentos.addEventListener(
"input",
pesquisarMomentos
);
}
/* Executa a pesquisa inicial */
pesquisarMomentos();
}
/* ==================================================
CATÁLOGO NORMAL
================================================== */
else if (catalogoNormal) {
qInput.value = state.q;
sortSel.value = state.sort;
function saveUrl() {
const p = new URLSearchParams();
if (state.q) p.set("q", state.q);
if (state.cat !== "todas") p.set("cat", state.cat);
if (state.sort !== "destaque") p.set("sort", state.sort);
history.replaceState(
null,
"",
location.pathname +
(p.toString() ? "?" + p.toString() : "")
);
}
function renderChips() {
const all = [
{ id: "todas", name: "Todas" }
].concat(categories);
chipsEl.innerHTML = all
.map((c) => `
<button
class="chip ${state.cat === c.id ? "active" : ""}"
data-cat="${esc(c.id)}"
>
${esc(c.name)}
</button>
`)
.join("");
}
function render() {
const q = state.q.trim().toLowerCase();
let list = trending.filter((c) =>
state.cat === "todas" ||
c.category_id === state.cat
);
if (q) {
list = list.filter((c) =>
(c.title || "").toLowerCase().includes(q) ||
(c.synopsis || "").toLowerCase().includes(q)
);
}
list = list.slice();
if (state.sort === "nota") {
list.sort((a, b) =>
num(b.rating) - num(a.rating)
);
} else if (state.sort === "az") {
list.sort((a, b) =>
a.title.localeCompare(b.title, "pt-BR")
);
} else if (state.sort === "ano-desc") {
list.sort((a, b) =>
num(b.year) - num(a.year)
);
} else if (state.sort === "ano-asc") {
list.sort((a, b) =>
num(a.year) - num(b.year)
);
}
countEl.textContent =
list.length +
" título" +
(list.length !== 1 ? "s" : "");
if (list.length === 0) {
resultEl.innerHTML = `
<div class="empty">
<p class="t">Nenhum título encontrado</p>
<p class="d">
Nada na pista para "${esc(state.q)}".
Tente outra busca ou limpe os filtros.
</p>
<button class="btn" id="clear">
Limpar filtros
</button>
</div>
`;
} else {
resultEl.innerHTML = `
<div class="grid grid-main">
${list.map((it) =>
'<div class="reveal">' +
cardHTML(it) +
"</div>"
).join("")}
</div>
`;
if (typeof observeReveals === "function") {
observeReveals(resultEl);
}
}
}
qInput.addEventListener("input", () => {
state.q = qInput.value;
saveUrl();
render();
});
sortSel.addEventListener("change", () => {
state.sort = sortSel.value;
saveUrl();
render();
});
document.addEventListener("click", (e) => {
const chip = e.target.closest("[data-cat]");
if (chip) {
const destinos = {
pilotos: "pilotos.php",
equipes: "equipes.php",
circuitos: "circuitos.html",
"momentos-historicos": "momentos-historicos.html"
};
if (destinos[chip.dataset.cat]) {
location.href = destinos[chip.dataset.cat];
return;
}
state.cat = chip.dataset.cat;
saveUrl();
renderChips();
render();
}
if (e.target.closest("#clear")) {
state.q = "";
state.cat = "todas";
state.sort = "destaque";
qInput.value = "";
sortSel.value = "destaque";
saveUrl();
renderChips();
render();
}
});
renderChips();
render();
}