// Dados do site (títulos, categorias, carrossel). As imagens podem ser links ou arquivos da pasta img/ (ex.: "img/senna.jpg").
const heroSlides = [
  {
    id: "slide-1",
    tag: "Original F1Racer",
    lines: [
      { t: "A emoção da" },
      { t: "Fórmula 1", accent: true },
      { t: "em um só lugar" },
    ],
    subtitle:
      "Documentários, corridas históricas, bastidores e muito mais do mundo da Fórmula 1. Viva essa paixão!",
    image:
      "https://static.prod-images.emergentagent.com/jobs/649a04c3-7e10-40d5-8cf8-646c90d8f4d6/images/ada5c33ae85c9bc2e0ad9f1e45ed3c768abe0a94a8c9129992af943e2e8b46d5.jpeg",
    title: "A Emoção da Fórmula 1",
    badge: "Destaque",
    year: "2026",
    duration: "Coleção completa",
    rating: "NOVO",
    synopsis:
      "A porta de entrada para o universo da Fórmula 1: curadoria especial com os melhores documentários, corridas históricas restauradas em 4K e séries inéditas sobre os bastidores da categoria mais rápida do planeta.",
  },
  {
    id: "slide-2",
    tag: "Coleção Lendas",
    lines: [
      { t: "Lendas e" },
      { t: "Rivalidades", accent: true },
      { t: "que marcaram época" },
    ],
    subtitle:
      "Reviva os maiores duelos da pista, de Senna a Hamilton, em qualidade impressionante.",
    image:
      "https://static.prod-images.emergentagent.com/jobs/649a04c3-7e10-40d5-8cf8-646c90d8f4d6/images/7f7fb2a88190a85c591754a85392e97010942d273326d40ec0f6f62a7ab707f3.jpeg",
    title: "Lendas e Rivalidades",
    badge: "Coleção",
    year: "2010–2026",
    duration: "12 títulos",
    rating: "4.9",
    synopsis:
      "Uma coleção imperdível com os maiores nomes da história da Fórmula 1. Duelos inesquecíveis, ultrapassagens lendárias e histórias humanas que transcenderam o esporte.",
  },
  {
    id: "slide-3",
    tag: "Bastidores",
    lines: [
      { t: "Bastidores da" },
      { t: "Grid", accent: true },
      { t: "como nunca antes" },
    ],
    subtitle:
      "Do pit lane ao paddock: a Fórmula 1 por dentro, corrida após corrida.",
    image:
      "https://static.prod-images.emergentagent.com/jobs/649a04c3-7e10-40d5-8cf8-646c90d8f4d6/images/1a4a1b0860ec87b2a985f9f8e39f80c70c3e4415411d44ded2ffabab0a5923c1.jpeg",
    title: "Bastidores da Grid",
    badge: "Série",
    year: "2025",
    duration: "6 episódios",
    rating: "4.8",
    synopsis:
      "Acompanhe equipes e pilotos durante uma temporada inteira. Estratégia, pressão e adrenalina: tudo o que acontece atrás das câmeras antes de as luzes se apagarem.",
  },
];

const trending = [
  {
    id: "senna",
    category_id: "documentarios",
    title: "Senna",
    badge: "Lenda",
    year: "2010",
    duration: "1h 46m",
    rating: "4.9",
    image:
      "https://i.pinimg.com/736x/66/1f/c3/661fc36718b15f79c3b8a2625ce2bd1e.jpg",
    synopsis:
      "A trajetória do maior ídolo do automobilismo brasileiro: do kart em Interlagos ao tricampeonato mundial, com imagens inéditas e depoimentos de quem conviveu com o mito dentro e fora das pistas.",
  },
  {
    id: "f1-movie",
    category_id: "documentarios",
    title: "F1: The Movie",
    badge: "Lançamento",
    year: "2025",
    duration: "2h 15m",
    rating: "4.8",
    image:
      "https://i.pinimg.com/1200x/91/42/9f/91429f70e464f643b0be70428e469f4d.jpg",
    synopsis:
      "Um piloto que saiu das pistas no auge retorna para treinar a novata sensação da equipe. Velocidade, redenção e filmagens reais nos finais de semana de Grande Prêmio.",
  },
  {
    id: "drive-to-survive",
    category_id: "equipes",
    title: "Drive to Survive",
    badge: "Série",
    year: "2024",
    duration: "6 temporadas",
    rating: "4.9",
    image:
      "https://i.pinimg.com/736x/92/f8/5b/92f85b3f5491a78bd87ec1f5574b8cd3.jpg",
    synopsis:
      "A série que colocou a Fórmula 1 no centro do mundo: bastidores das equipes, negociações, rivalidades e a vida dos pilotos dentro e fora do cockpit, temporada após temporada.",
  },
  {
    id: "schumacher",
    category_id: "documentarios",
    title: "Schumacher",
    badge: "Doc",
    year: "2021",
    duration: "1h 52m",
    rating: "4.7",
    image:
      "https://i.pinimg.com/736x/bb/93/f0/bb93f080e0d3b6d60175cec5b9934d9c.jpg",
    synopsis:
      "Retrato íntimo do heptacampeão mundial: a ascensão no kart, os títulos históricos e a batalha da família depois do acidente, contada por quem está ao seu lado até hoje.",
  },
  {
    id: "hamilton",
    category_id: "documentarios",
    title: "Hamilton",
    badge: "Exclusivo",
    year: "2023",
    duration: "1h 38m",
    rating: "4.8",
    image:
      "https://i.pinimg.com/1200x/72/7f/b1/727fb1dc33088138495a99734b01462a.jpg",
    synopsis:
      "Da periferia de Londres ao topo da Fórmula 1: a jornada do piloto mais vitorioso da era moderna e seu impacto dentro e fora das pistas.",
  },
  {
    id: "prost",
    category_id: "documentarios",
    title: "Alain Prost: O Professor",
    badge: "Documentário",
    year: "2024",
    duration: "Especial",
    rating: "4.7",
    image: "https://i.pinimg.com/736x/18/16/97/181697cc8753b62e6da405e681882bf9.jpg",
    synopsis: "A trajetória de Alain Prost, conhecido pela inteligência estratégica, precisão e rivalidade histórica nas pistas.",
    trailer_id: "sfosF-ZAbR4"
  },
  {
    id: "nigel-mansell",
    category_id: "documentarios",
    title: "Nigel Mansell: O Leão",
    badge: "Lendas da F1",
    year: "2023",
    duration: "Especial",
    rating: "4.6",
    image: "https://i.pinimg.com/736x/10/ce/3d/10ce3d1758537f630be2ef01b7022d1b.jpg",
    synopsis: "Uma retrospectiva sobre a coragem, a velocidade e o título mundial de Nigel Mansell.",
    trailer_id: "sfosF-ZAbR4"
  },
  {
    id: "niki-lauda",
    category_id: "documentarios",
    title: "Niki Lauda: Além do Limite",
    badge: "Documentário",
    year: "2022",
    duration: "Especial",
    rating: "4.8",
    image: "https://i.pinimg.com/736x/37/10/2b/37102b386c0f08dfd63729744647e934.jpg",
    synopsis: "A história de superação de Niki Lauda, sua volta às pistas e uma das rivalidades mais marcantes do automobilismo.",
    trailer_id: "CT2_P2DZBR0"
  },
  {
    id: "verstappen",
    category_id: "documentarios",
    title: "Max Verstappen: Instinto de Campeão",
    badge: "Pilotos",
    year: "2024",
    duration: "Especial",
    rating: "4.7",
    image: "https://i.pinimg.com/736x/4c/10/0e/4c100ea2ea94bffbaff518dd2ac4cbfd.jpg",
    synopsis: "A ascensão de Max Verstappen e a mentalidade competitiva por trás de suas conquistas na Fórmula 1.",
    trailer_id: "CT2_P2DZBR0"
  },
  {
    id: "the-first-lap",
    category_id: "pilotos",
    title: "The First Lap",
    badge: "Original",
    year: "2024",
    duration: "1h 20m",
    rating: "4.6",
    image:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlV3N81ipktsVhfr-YP6K3rREdI8LJ8b0oZjt5nLAo8YmwlKkM8Ccu1zvk&s=10",
    synopsis:
      "Um original F1Racer sobre a estreia dos novatos na Fórmula 1: a primeira volta, o primeiro erro e o que leva um piloto a arriscar tudo na curva um.",
  },
];

const categories = [
  {
    id: "documentarios",
    name: "Documentários",
    count: "8 títulos",
    icon: "Film",
    image:
      "https://i.pinimg.com/1200x/56/19/29/561929cc6bbb67ff2d69264997073244.jpg",
  },
  {
    id: "momentos-historicos",
    name: "Momentos Históricos",
    count: "150+ corridas",
    icon: "Trophy",
    image:
      "https://i.pinimg.com/1200x/d6/58/fe/d658fe268088dbfcb1bc53f088163066.jpg",
  },
  {
    id: "pilotos",
    name: "Pilotos",
    count: "Perfis e entrevistas",
    icon: "User",
    image:
      "https://i.pinimg.com/736x/3b/4e/40/3b4e4052d5955fa0f0ab9d306633d1bd.jpg",
  },
  {
    id: "equipes",
    name: "Equipes",
    count: "Bastidores do paddock",
    icon: "Shield",
    image:
      "https://i.pinimg.com/1200x/38/3a/83/383a83a8b0379aab2262e35c9ab81df0.jpg",
  },
  {
    id: "circuitos",
    name: "Circuitos",
    count: "Pistas e vídeos",
    icon: "Zap",
    image:
      "https://i.pinimg.com/736x/97/53/37/97533764d1830db44b076daf1cad0419.jpg",
  },
];

const marqueeItems = [
  "Senna: o mito do Brasil",
  "Drive to Survive — T6",
  "GP de São Paulo • Interlagos",
  "Schumacher: o documentário",
  "Corridas históricas em 4K",
  "Bastidores do paddock",
];

// IDs de vídeo do YouTube (parte depois de "v=" no link). Sem ID = mostra o pôster.
const TRAILERS = {
  senna: "sfosF-ZAbR4",
  "f1-movie": "CT2_P2DZBR0",
  "slide-1": "CT2_P2DZBR0",
  "slide-2": "sfosF-ZAbR4",
  "drive-to-survive": "7yY6qANStNg",
  "schumacher": "98OykDbVGzk",
  prost: "HpIdRy0YVBs",
  "nigel-mansell": "tAHbD9_BMik",
  "niki-lauda": "cf2ybJ-ZNkM",
  verstappen: "jNElkuNF1kU",
  hamilton: "_fgoQ_IMh7A",
};