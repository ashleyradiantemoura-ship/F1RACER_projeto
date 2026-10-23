-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/10/2026 às 18:38
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `f1race`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `ordem` int(11) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `slug`, `ordem`, `ativo`) VALUES
(1, 'Melhores momentos', 'melhores-momentos', 1, 1),
(2, 'Pilotos', 'pilotos', 2, 1),
(3, 'Equipes', 'equipes', 3, 1),
(4, 'Momentos históricos', 'momentos-historicos', 4, 1),
(5, 'Circuitos', 'circuitos', 5, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `conteudos`
--

CREATE TABLE `conteudos` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(220) NOT NULL,
  `descricao_curta` varchar(500) NOT NULL,
  `descricao_detalhada` text DEFAULT NULL,
  `video_url` varchar(500) DEFAULT NULL,
  `imagem_url` varchar(1000) DEFAULT NULL,
  `ano` varchar(20) DEFAULT NULL,
  `local` varchar(150) DEFAULT NULL,
  `destaque` tinyint(1) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `conteudos`
--

INSERT INTO `conteudos` (`id`, `categoria_id`, `titulo`, `descricao_curta`, `descricao_detalhada`, `video_url`, `imagem_url`, `ano`, `local`, `destaque`, `ativo`, `criado_em`) VALUES
(1, 1, 'O erro de Senna', 'Ayrton Senna conquistou uma pole extraordinária em Mônaco em 1988, mas bateu quando liderava a corrida.', 'No GP de Mônaco de 1988, Ayrton Senna conquistou a pole position com uma volta extraordinária, superando Alain Prost por mais de um segundo. Durante a corrida, liderava com ampla vantagem quando perdeu o controle na curva Portier e bateu. O episódio tornou-se um dos momentos mais lembrados daquela temporada.', 'https://youtu.be/YU9N70cNRX4', NULL, '1988', 'Monte Carlo, Mônaco', 1, 1, '2026-10-22 12:28:50'),
(2, 4, 'O erro de Senna', 'Ayrton Senna conquistou uma pole extraordinária em Mônaco em 1988, mas bateu quando liderava a corrida.', 'No GP de Mônaco de 1988, Ayrton Senna conquistou a pole position com uma volta extraordinária, superando Alain Prost por mais de um segundo. Durante a corrida, liderava com ampla vantagem quando perdeu o controle na curva Portier e bateu. O episódio tornou-se um dos momentos mais lembrados daquela temporada.', 'https://youtu.be/YU9N70cNRX4', NULL, '1988', 'Monte Carlo, Mônaco', 1, 1, '2026-10-22 12:28:50'),
(3, 1, 'A recuperação histórica de Fangio em Nürburgring (1957)', 'Juan Manuel Fangio recuperou quase 50 segundos e ultrapassou Mike Hawthorn e Peter Collins na última volta, garantindo seu quinto título mundial.', 'Em uma das atuações mais marcantes de sua carreira, Juan Manuel Fangio compensou uma parada demorada nos boxes com voltas extremamente rápidas. A recuperação culminou em ultrapassagens decisivas na volta final e ajudou a garantir mais um título mundial.', 'https://youtu.be/YU9N70cNRX4', NULL, '1957', 'Nürburgring, Alemanha', 1, 1, '2026-10-22 12:28:50'),
(4, 4, 'A recuperação histórica de Fangio em Nürburgring (1957)', 'Juan Manuel Fangio recuperou quase 50 segundos e ultrapassou Mike Hawthorn e Peter Collins na última volta, garantindo seu quinto título mundial.', 'Em uma das atuações mais marcantes de sua carreira, Juan Manuel Fangio compensou uma parada demorada nos boxes com voltas extremamente rápidas. A recuperação culminou em ultrapassagens decisivas na volta final e ajudou a garantir mais um título mundial.', 'https://youtu.be/YU9N70cNRX4', NULL, '1957', 'Nürburgring, Alemanha', 1, 1, '2026-10-22 12:28:50'),
(5, 1, 'A estreia mágica de Senna sob chuva (Mônaco, 1984)', 'Em sua temporada de estreia, Ayrton Senna brilhou na chuva em Mônaco e se aproximou da vitória antes da interrupção da corrida.', 'Ao volante da Toleman, Ayrton Senna mostrou controle e velocidade em condições difíceis. A prova foi interrompida antes que ele pudesse disputar a vitória até o fim, mas sua atuação chamou a atenção do mundo da Fórmula 1.', 'https://youtu.be/lorinQQm_rY', NULL, '1984', 'Mônaco', 1, 1, '2026-10-22 12:28:50'),
(6, 4, 'A estreia mágica de Senna sob chuva (Mônaco, 1984)', 'Em sua temporada de estreia, Ayrton Senna brilhou na chuva em Mônaco e se aproximou da vitória antes da interrupção da corrida.', 'Ao volante da Toleman, Ayrton Senna mostrou controle e velocidade em condições difíceis. A prova foi interrompida antes que ele pudesse disputar a vitória até o fim, mas sua atuação chamou a atenção do mundo da Fórmula 1.', 'https://youtu.be/lorinQQm_rY', NULL, '1984', 'Mônaco', 1, 1, '2026-10-22 12:28:50'),
(7, 1, 'A volta mágica de Senna em Donington (1993)', 'Na chuva, Senna saiu da quarta posição e assumiu a liderança ainda na primeira volta do GP da Europa.', 'A primeira volta de Ayrton Senna no GP da Europa de 1993 é lembrada por uma sequência impressionante de ultrapassagens em pista molhada, que o levou da quarta posição à liderança.', 'https://youtu.be/pktF3wJKfxo', NULL, '1993', 'Donington Park, Europa', 1, 1, '2026-10-22 12:28:50'),
(8, 4, 'A volta mágica de Senna em Donington (1993)', 'Na chuva, Senna saiu da quarta posição e assumiu a liderança ainda na primeira volta do GP da Europa.', 'A primeira volta de Ayrton Senna no GP da Europa de 1993 é lembrada por uma sequência impressionante de ultrapassagens em pista molhada, que o levou da quarta posição à liderança.', 'https://youtu.be/pktF3wJKfxo', NULL, '1993', 'Donington Park, Europa', 1, 1, '2026-10-22 12:28:50'),
(9, 1, 'O retorno de Niki Lauda (Itália, 1976)', 'Poucas semanas após um grave acidente, Niki Lauda voltou a competir no GP da Itália.', 'A volta de Niki Lauda à Ferrari, apenas algumas semanas após o acidente em Nürburgring, ficou marcada pela determinação do piloto e pela rapidez com que retornou à competição.', 'https://youtu.be/BG9zLkF9eVo', NULL, '1976', 'Monza, Itália', 1, 1, '2026-10-22 12:28:50'),
(10, 4, 'O retorno de Niki Lauda (Itália, 1976)', 'Poucas semanas após um grave acidente, Niki Lauda voltou a competir no GP da Itália.', 'A volta de Niki Lauda à Ferrari, apenas algumas semanas após o acidente em Nürburgring, ficou marcada pela determinação do piloto e pela rapidez com que retornou à competição.', 'https://youtu.be/BG9zLkF9eVo', NULL, '1976', 'Monza, Itália', 1, 1, '2026-10-22 12:28:50'),
(11, 1, 'O título decidido na última curva (Brasil, 2008)', 'Lewis Hamilton garantiu seu primeiro campeonato ao conquistar a posição decisiva na última volta em Interlagos.', 'Em uma final dramática sob condições variáveis, Lewis Hamilton conquistou a posição necessária na última volta do GP do Brasil e garantiu seu primeiro título mundial.', 'https://youtu.be/Sp_YoqhCmAg', NULL, '2008', 'Interlagos, Brasil', 1, 1, '2026-10-22 12:28:50'),
(12, 4, 'O título decidido na última curva (Brasil, 2008)', 'Lewis Hamilton garantiu seu primeiro campeonato ao conquistar a posição decisiva na última volta em Interlagos.', 'Em uma final dramática sob condições variáveis, Lewis Hamilton conquistou a posição necessária na última volta do GP do Brasil e garantiu seu primeiro título mundial.', 'https://youtu.be/Sp_YoqhCmAg', NULL, '2008', 'Interlagos, Brasil', 1, 1, '2026-10-22 12:28:50'),
(13, 1, 'A decisão dramática em Abu Dhabi (2021)', 'Max Verstappen e Lewis Hamilton chegaram à etapa final empatados em pontos; a disputa pelo título foi decidida na última volta.', 'A temporada de 2021 foi decidida em uma última volta controversa, quando Max Verstappen ultrapassou Lewis Hamilton após a relargada. O episódio gerou debates sobre os procedimentos de direção de prova.', 'https://youtu.be/MTe12fH2xtQ', NULL, '2021', 'Abu Dhabi', 1, 1, '2026-10-22 12:28:50'),
(14, 4, 'A decisão dramática em Abu Dhabi (2021)', 'Max Verstappen e Lewis Hamilton chegaram à etapa final empatados em pontos; a disputa pelo título foi decidida na última volta.', 'A temporada de 2021 foi decidida em uma última volta controversa, quando Max Verstappen ultrapassou Lewis Hamilton após a relargada. O episódio gerou debates sobre os procedimentos de direção de prova.', 'https://youtu.be/MTe12fH2xtQ', NULL, '2021', 'Abu Dhabi', 1, 1, '2026-10-22 12:28:50'),
(15, 1, 'A primeira vitória de Rubens Barrichello (Alemanha, 2000)', 'Largando em 18º, Rubens Barrichello aproveitou uma corrida imprevisível para conquistar sua primeira vitória na F1.', 'Em uma prova marcada por mudanças climáticas e estratégias de pneus, Rubens Barrichello fez uma corrida de recuperação e conquistou sua primeira vitória na Fórmula 1 pela Ferrari.', 'https://youtu.be/96wCoIKgzlI', NULL, '2000', 'Hockenheim, Alemanha', 1, 1, '2026-10-22 12:28:50'),
(16, 4, 'A primeira vitória de Rubens Barrichello (Alemanha, 2000)', 'Largando em 18º, Rubens Barrichello aproveitou uma corrida imprevisível para conquistar sua primeira vitória na F1.', 'Em uma prova marcada por mudanças climáticas e estratégias de pneus, Rubens Barrichello fez uma corrida de recuperação e conquistou sua primeira vitória na Fórmula 1 pela Ferrari.', 'https://youtu.be/96wCoIKgzlI', NULL, '2000', 'Hockenheim, Alemanha', 1, 1, '2026-10-22 12:28:50'),
(17, 1, 'Ímola 1994: um fim de semana que mudou a F1', 'As mortes de Roland Ratzenberger e Ayrton Senna marcaram profundamente a categoria e aceleraram mudanças de segurança.', 'O fim de semana do GP de San Marino de 1994 foi um dos mais tristes da história da categoria. As perdas de Roland Ratzenberger e Ayrton Senna tiveram grande impacto nas discussões e nas melhorias de segurança do automobilismo.', 'https://youtu.be/kmAB-Vo4Tf4', NULL, '1994', 'Ímola, San Marino', 1, 1, '2026-10-22 12:28:50'),
(18, 4, 'Ímola 1994: um fim de semana que mudou a F1', 'As mortes de Roland Ratzenberger e Ayrton Senna marcaram profundamente a categoria e aceleraram mudanças de segurança.', 'O fim de semana do GP de San Marino de 1994 foi um dos mais tristes da história da categoria. As perdas de Roland Ratzenberger e Ayrton Senna tiveram grande impacto nas discussões e nas melhorias de segurança do automobilismo.', 'https://youtu.be/kmAB-Vo4Tf4', NULL, '1994', 'Ímola, San Marino', 1, 1, '2026-10-22 12:28:50'),
(19, 1, 'Mansell e Senna lado a lado (Espanha, 1991)', 'Nigel Mansell e Ayrton Senna dividiram a reta de Barcelona em uma disputa roda a roda que virou imagem icônica.', 'Nigel Mansell e Ayrton Senna disputaram espaço lado a lado na reta principal do circuito espanhol. A cena se tornou uma das imagens mais lembradas da rivalidade esportiva daquela época.', 'https://youtu.be/oa5gP-xscpY', NULL, '1991', 'Barcelona, Espanha', 1, 1, '2026-10-22 12:28:50'),
(20, 4, 'Mansell e Senna lado a lado (Espanha, 1991)', 'Nigel Mansell e Ayrton Senna dividiram a reta de Barcelona em uma disputa roda a roda que virou imagem icônica.', 'Nigel Mansell e Ayrton Senna disputaram espaço lado a lado na reta principal do circuito espanhol. A cena se tornou uma das imagens mais lembradas da rivalidade esportiva daquela época.', 'https://youtu.be/oa5gP-xscpY', NULL, '1991', 'Barcelona, Espanha', 1, 1, '2026-10-22 12:28:50'),
(21, 1, 'Schumacher encerra o jejum da Ferrari (Japão, 2000)', 'A vitória de Michael Schumacher em Suzuka garantiu à Ferrari seu primeiro título de pilotos desde 1979.', 'Michael Schumacher venceu o GP do Japão de 2000 e assegurou o campeonato de pilotos, encerrando um longo período sem título para a Ferrari e iniciando uma fase histórica para a equipe.', 'https://youtu.be/hr6g1nLgoPc', NULL, '2000', 'Suzuka, Japão', 1, 1, '2026-10-22 12:28:50'),
(22, 4, 'Schumacher encerra o jejum da Ferrari (Japão, 2000)', 'A vitória de Michael Schumacher em Suzuka garantiu à Ferrari seu primeiro título de pilotos desde 1979.', 'Michael Schumacher venceu o GP do Japão de 2000 e assegurou o campeonato de pilotos, encerrando um longo período sem título para a Ferrari e iniciando uma fase histórica para a equipe.', 'https://youtu.be/hr6g1nLgoPc', NULL, '2000', 'Suzuka, Japão', 1, 1, '2026-10-22 12:28:50'),
(23, 1, 'Verstappen faz história na Espanha (2016)', 'Aos 18 anos, Max Verstappen venceu pela primeira vez na Fórmula 1 e tornou-se o vencedor mais jovem de um Grande Prêmio.', 'Em sua estreia pela Red Bull Racing, Max Verstappen aproveitou uma corrida estratégica em Barcelona e administrou a pressão de Kimi Räikkönen até conquistar uma vitória histórica.', 'https://www.youtube.com/watch?v=3B3-C914d_c', NULL, '2016', 'Barcelona, Espanha', 1, 1, '2026-10-22 12:28:50'),
(24, 4, 'Verstappen faz história na Espanha (2016)', 'Aos 18 anos, Max Verstappen venceu pela primeira vez na Fórmula 1 e tornou-se o vencedor mais jovem de um Grande Prêmio.', 'Em sua estreia pela Red Bull Racing, Max Verstappen aproveitou uma corrida estratégica em Barcelona e administrou a pressão de Kimi Räikkönen até conquistar uma vitória histórica.', 'https://www.youtube.com/watch?v=3B3-C914d_c', NULL, '2016', 'Barcelona, Espanha', 1, 1, '2026-10-22 12:28:50'),
(25, 1, 'Ricciardo ataca e vence na China (2018)', 'Daniel Ricciardo aproveitou a entrada do safety car para realizar ultrapassagens decisivas e vencer em Xangai.', 'Após a entrada do safety car, a Red Bull chamou seus pilotos aos boxes. Com pneus mais novos, Daniel Ricciardo realizou ultrapassagens decisivas e conquistou a vitória no GP da China.', 'https://www.youtube.com/watch?v=uiub1DnUnkg', NULL, '2018', 'Xangai, China', 1, 1, '2026-10-22 12:28:50'),
(26, 4, 'Ricciardo ataca e vence na China (2018)', 'Daniel Ricciardo aproveitou a entrada do safety car para realizar ultrapassagens decisivas e vencer em Xangai.', 'Após a entrada do safety car, a Red Bull chamou seus pilotos aos boxes. Com pneus mais novos, Daniel Ricciardo realizou ultrapassagens decisivas e conquistou a vitória no GP da China.', 'https://www.youtube.com/watch?v=uiub1DnUnkg', NULL, '2018', 'Xangai, China', 1, 1, '2026-10-22 12:28:50'),
(27, 1, 'Leclerc conquista Monza para a Ferrari (2019)', 'Charles Leclerc resistiu à pressão dos pilotos da Mercedes e venceu diante dos torcedores da Ferrari.', 'Charles Leclerc defendeu sua posição sob forte pressão de Lewis Hamilton e Valtteri Bottas, garantindo um triunfo especial no lendário circuito de Monza.', 'https://www.youtube.com/watch?v=h-ce3gPMsGc', NULL, '2019', 'Monza, Itália', 1, 1, '2026-10-22 12:28:50'),
(28, 4, 'Leclerc conquista Monza para a Ferrari (2019)', 'Charles Leclerc resistiu à pressão dos pilotos da Mercedes e venceu diante dos torcedores da Ferrari.', 'Charles Leclerc defendeu sua posição sob forte pressão de Lewis Hamilton e Valtteri Bottas, garantindo um triunfo especial no lendário circuito de Monza.', 'https://www.youtube.com/watch?v=h-ce3gPMsGc', NULL, '2019', 'Monza, Itália', 1, 1, '2026-10-22 12:28:50'),
(29, 1, 'Jenson Button vence uma corrida épica (Canadá, 2011)', 'Em uma corrida marcada por chuva, interrupções e reviravoltas, Button venceu na última volta.', 'O GP do Canadá de 2011 foi marcado por chuva intensa, safety cars e disputas até os últimos instantes. Jenson Button recuperou-se de incidentes e ultrapassou Sebastian Vettel na volta final para vencer.', 'https://www.youtube.com/watch?v=BL2cPQ5L4Qw', NULL, '2011', 'Montreal, Canadá', 1, 1, '2026-10-22 12:28:50'),
(30, 4, 'Jenson Button vence uma corrida épica (Canadá, 2011)', 'Em uma corrida marcada por chuva, interrupções e reviravoltas, Button venceu na última volta.', 'O GP do Canadá de 2011 foi marcado por chuva intensa, safety cars e disputas até os últimos instantes. Jenson Button recuperou-se de incidentes e ultrapassou Sebastian Vettel na volta final para vencer.', 'https://www.youtube.com/watch?v=BL2cPQ5L4Qw', NULL, '2011', 'Montreal, Canadá', 1, 1, '2026-10-22 12:28:50'),
(31, 1, 'A decisão eletrizante do campeonato de 2012', 'Sebastian Vettel superou uma corrida complicada em Interlagos e garantiu o tricampeonato mundial.', 'No GP do Brasil de 2012, Vettel enfrentou uma corrida complicada após um incidente nas primeiras voltas. Em meio à chuva e às mudanças de estratégia, recuperou posições e terminou em sexto, resultado suficiente para conquistar o tricampeonato.', 'https://www.youtube.com/watch?v=fG-XaGUW1Lc', NULL, '2012', 'Interlagos, Brasil', 1, 1, '2026-10-22 12:28:50'),
(32, 4, 'A decisão eletrizante do campeonato de 2012', 'Sebastian Vettel superou uma corrida complicada em Interlagos e garantiu o tricampeonato mundial.', 'No GP do Brasil de 2012, Vettel enfrentou uma corrida complicada após um incidente nas primeiras voltas. Em meio à chuva e às mudanças de estratégia, recuperou posições e terminou em sexto, resultado suficiente para conquistar o tricampeonato.', 'https://www.youtube.com/watch?v=fG-XaGUW1Lc', NULL, '2012', 'Interlagos, Brasil', 1, 1, '2026-10-22 12:28:50'),
(33, 1, 'Sergio Pérez conquista sua primeira vitória (Sakhir, 2020)', 'Após cair para o fim do pelotão na primeira volta, Pérez realizou uma recuperação extraordinária e venceu.', 'Sergio Pérez sofreu um incidente na primeira volta do GP de Sakhir e caiu para as últimas posições. Com ritmo consistente e estratégia eficiente, recuperou-se e conquistou sua primeira vitória na Fórmula 1.', 'https://www.youtube.com/watch?v=H0zwR2drgV4', NULL, '2020', 'Sakhir, Bahrein', 1, 1, '2026-10-22 12:28:50'),
(34, 4, 'Sergio Pérez conquista sua primeira vitória (Sakhir, 2020)', 'Após cair para o fim do pelotão na primeira volta, Pérez realizou uma recuperação extraordinária e venceu.', 'Sergio Pérez sofreu um incidente na primeira volta do GP de Sakhir e caiu para as últimas posições. Com ritmo consistente e estratégia eficiente, recuperou-se e conquistou sua primeira vitória na Fórmula 1.', 'https://www.youtube.com/watch?v=H0zwR2drgV4', NULL, '2020', 'Sakhir, Bahrein', 1, 1, '2026-10-22 12:28:50'),
(35, 1, 'Hamilton alcança o heptacampeonato na Turquia (2020)', 'Lewis Hamilton venceu em Istambul e igualou o recorde de sete títulos mundiais.', 'Em condições difíceis de aderência no circuito de Istambul, Lewis Hamilton administrou os pneus e a estratégia para conquistar a vitória e seu sétimo campeonato mundial.', 'https://www.youtube.com/watch?v=bg3v8VKEtBc', NULL, '2020', 'Istambul, Turquia', 1, 1, '2026-10-22 12:28:50'),
(36, 4, 'Hamilton alcança o heptacampeonato na Turquia (2020)', 'Lewis Hamilton venceu em Istambul e igualou o recorde de sete títulos mundiais.', 'Em condições difíceis de aderência no circuito de Istambul, Lewis Hamilton administrou os pneus e a estratégia para conquistar a vitória e seu sétimo campeonato mundial.', 'https://www.youtube.com/watch?v=bg3v8VKEtBc', NULL, '2020', 'Istambul, Turquia', 1, 1, '2026-10-22 12:28:50'),
(37, 1, 'Caos e ultrapassagens em Hockenheim (Alemanha, 2019)', 'Uma corrida sob chuva e cheia de reviravoltas terminou com Max Verstappen na vitória e Sebastian Vettel em segundo.', 'O GP da Alemanha de 2019 foi uma das corridas mais imprevisíveis da temporada. A pista molhada provocou erros e mudanças de estratégia; Verstappen venceu e Vettel recuperou-se até a segunda posição.', 'https://www.youtube.com/watch?v=RYHQmBULhLc', NULL, '2019', 'Hockenheim, Alemanha', 1, 1, '2026-10-22 12:28:50'),
(38, 4, 'Caos e ultrapassagens em Hockenheim (Alemanha, 2019)', 'Uma corrida sob chuva e cheia de reviravoltas terminou com Max Verstappen na vitória e Sebastian Vettel em segundo.', 'O GP da Alemanha de 2019 foi uma das corridas mais imprevisíveis da temporada. A pista molhada provocou erros e mudanças de estratégia; Verstappen venceu e Vettel recuperou-se até a segunda posição.', 'https://www.youtube.com/watch?v=RYHQmBULhLc', NULL, '2019', 'Hockenheim, Alemanha', 1, 1, '2026-10-22 12:28:50');

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipes`
--

CREATE TABLE `equipes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `pais` varchar(80) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `sobre` text NOT NULL,
  `carro` varchar(120) NOT NULL,
  `descricao_carro` text NOT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `equipes`
--

INSERT INTO `equipes` (`id`, `nome`, `pais`, `cidade`, `sobre`, `carro`, `descricao_carro`, `imagem`) VALUES
(1, 'McLaren', 'Reino Unido', 'Woking, Inglaterra', 'A McLaren é uma das equipes mais tradicionais e vitoriosas da história da Fórmula 1. Fundada em 1963 por Bruce McLaren, a equipe britânica conquistou diversos campeonatos mundiais e ficou conhecida por revelar grandes pilotos, como Ayrton Senna, Alain Prost e Mika Häkkinen. Suas cores tradicionais incluem o laranja, que se tornou uma marca registrada da equipe. Em 2026, a McLaren compete com Lando Norris e Oscar Piastri, dois pilotos reconhecidos por sua velocidade e talento. Seu principal objetivo é continuar disputando vitórias e campeonatos, mantendo sua posição entre as equipes mais competitivas da categoria.', 'McLaren 2026', 'O McLaren MCL40 apresenta a tradicional pintura laranja papaya com detalhes pretos. O carro utiliza uma unidade de potência Mercedes, com motor V6 turbo híbrido de 1,6 litro com potência de até 476 cv. Sua estrutura é feita principalmente de fibra de carbono, combinando leveza e resistência. Também possui aerodinâmica ativa, suspensão de competição e sistema de recuperação de energia elétrica, buscando melhorar a velocidade e a estabilidade nas curvas.', 'assets/img/equipes/mclaren.jpg'),
(2, 'Mercedes', 'Alemanha', 'Brackley, Inglaterra', 'A Mercedes é uma equipe alemã que se destacou especialmente pelo domínio exercido na Fórmula 1 a partir de 2014, durante a era dos motores híbridos. Ao longo de sua história, conquistou 8 títulos mundiais de construtores, principalmente durante o período de sucesso com Lewis Hamilton e Nico Rosberg. A equipe é conhecida pela excelência tecnológica, pela organização e pelo desenvolvimento de carros competitivos. Em 2026, seus pilotos são George Russell e Kimi Antonelli, que representam a experiência e a nova geração do automobilismo. Até o GP de Singapura de 2026, a Mercedes havia conquistado 11 vitórias em Grandes Prêmios e somava 578 pontos, liderando o campeonato de construtores. Esses resultados demonstram a força da equipe na temporada.', 'Mercedes 2026', 'O Mercedes W17 combina prata, preto e verde-turquesa em seu design. Utiliza uma unidade de potência desenvolvida pela própria Mercedes, com motor V6 turbo híbrido e potência de aproximadamente 476 cv. Seu chassi de fibra de carbono, a suspensão e a aerodinâmica ativa foram projetados para oferecer estabilidade e eficiência nas retas e curvas. O sistema elétrico permite recuperar energia durante a frenagem e utilizá-la para impulsionar o carro', 'assets/img/equipes/mercedes.webp'),
(3, 'Ferrari', 'Itália', 'Maranello, Itália', 'A Ferrari é a equipe mais antiga em atividade na Fórmula 1 e uma das mais famosas do automobilismo mundial. Fundada por Enzo Ferrari, participou do primeiro campeonato mundial da categoria, em 1950, e construiu uma história marcada por grandes conquistas e rivalidades. Seus carros vermelhos são conhecidos mundialmente, assim como seus torcedores, chamados de tifosi. Ao longo das décadas, a equipe teve pilotos lendários, como Michael Schumacher, Niki Lauda e Kimi Räikkönen. Em 2026, seus pilotos são Charles Leclerc e Lewis Hamilton. Até o GP de Singapura, a Ferrari havia conquistado 2 vitórias em Grandes Prêmios e acumulado 444 pontos no campeonato de construtores. Historicamente, a equipe possui 16 títulos mundiais de construtores, sendo uma das mais vitoriosas da categoria.', 'Ferrari 2026', 'O Ferrari SF-26 mantém o tradicional vermelho da equipe italiana, com detalhes que destacam sua identidade visual. Seu motor V6 turbo híbrido de 1,6 litro trabalha junto ao sistema elétrico para proporcionar aceleração e eficiência energética e potência de aproximadamente 476 cv. O carro possui chassi de fibra de carbono, suspensão de competição e asas com aerodinâmica ativa, que ajudam a equilibrar a aderência nas curvas e a velocidade nas retas.', 'assets/img/equipes/ferrari.jpg'),
(4, 'Red Bull Racing', 'Áustria', 'Milton Keynes, Inglaterra', 'A Red Bull Racing entrou na Fórmula 1 em 2005 e conquistou diversos títulos, tornando-se uma das equipes de destaque da categoria.', 'Red Bull 2026', 'O Red Bull RB22 apresenta as cores azul, vermelho e amarelo características da equipe. Em 2026, utiliza a unidade de potência Red Bull Ford, desenvolvida pela Red Bull Powertrains em parceria com a Ford. O carro possui motor V6 turbo híbrido com potência de aproximadamente 476 cv, chassi leve de fibra de carbono e aerodinâmica ativa. Seu sistema elétrico recupera energia durante as frenagens, contribuindo para o desempenho nas corridas.', 'assets/img/equipes/redbull.jpg'),
(5, 'Racing Bulls', 'Itália', 'Faenza, Itália', 'A Racing Bulls é uma equipe italiana ligada à Red Bull Racing e desempenha um papel importante na formação de novos pilotos para a Fórmula 1. Sua trajetória está relacionada à antiga Toro Rosso, equipe que ajudou a revelar talentos como Sebastian Vettel e Max Verstappen. A Racing Bulls costuma trabalhar com pilotos jovens, oferecendo oportunidades para que adquiram experiência e demonstrem suas habilidades na principal categoria do automobilismo. Em 2026, seus pilotos são Liam Lawson e Arvid Lindblad. Até o GP de Singapura, a equipe não havia conquistado vitórias em Grandes Prêmios na temporada, mas já acumulava 100 pontos no campeonato de construtores. A Racing Bulls ainda não conquistou títulos mundiais de construtores, mas continua sendo importante para o desenvolvimento de novos talentos ligados à Red Bull.', 'Racing Bulls 2026', 'O VCARB 03 apresenta uma pintura com tons claros e escuros, seguindo a identidade visual da Racing Bulls. Utiliza a unidade de potência Red Bull Ford de aproximadamente 476 cv, com motor V6 turbo híbrido de 1,6 litro. Sua estrutura leve, suspensão de competição e aerodinâmica ativa ajudam a equilibrar velocidade, aderência e consumo de energia ao longo das corridas.', 'assets/img/equipes/racing.jpg'),
(6, 'Aston Martin', 'Reino Unido', 'Silverstone, Inglaterra', 'A Aston Martin é uma equipe britânica associada a uma marca tradicional de carros esportivos de luxo. Sua atual participação na Fórmula 1 começou em 2021, após a transformação da antiga Racing Point. A equipe investiu bastante em infraestrutura, tecnologia e instalações modernas para aumentar sua competitividade. Um de seus grandes nomes é Fernando Alonso, bicampeão mundial conhecido por sua experiência e habilidade nas corridas. Em 2026, Alonso e Lance Stroll formam a dupla de pilotos da equipe. Até o GP de Singapura, a Aston Martin não havia conquistado vitórias em Grandes Prêmios na temporada e acumulava 7 pontos no campeonato de construtores. A equipe continua buscando melhorar seu desempenho e transformar seus investimentos em resultados mais expressivos.', 'Aston Martin 2026', 'O Aston Martin AMR26 destaca-se pela pintura verde característica da marca britânica. O carro utiliza uma unidade de potência Honda de aproximadamente 476 cv, composta por motor V6 turbo híbrido de 1,6 litro e sistema elétrico. Sua estrutura de fibra de carbono oferece resistência e leveza, enquanto a aerodinâmica ativa ajuda a ajustar o comportamento do carro nas retas e curvas.', 'assets/img/equipes/aston.jpg'),
(7, 'Alpine', 'França', 'Enstone, Inglaterra', 'A Alpine representa a tradição francesa na Fórmula 1 e está ligada à história da Renault, fabricante que conquistou dois títulos mundiais de construtores em 2005 e 2006. A equipe passou a competir com o nome Alpine em 2021, utilizando a categoria para divulgar sua marca esportiva. Ao longo de sua trajetória, enfrentou diferentes fases, alternando bons resultados com períodos de dificuldades. Em 2026, seus pilotos são Pierre Gasly e Franco Colapinto. Até o GP de Singapura, a Alpine não havia conquistado vitórias em Grandes Prêmios na temporada e acumulava 68 pontos no campeonato de construtores. Apesar de ainda não possuir títulos mundiais de construtores com o nome Alpine, a equipe tem uma história ligada às conquistas da Renault e busca melhorar seus resultados na categoria.', 'Alpine 2026', 'A Alpine representa a tradição francesa na Fórmula 1 e está ligada à história da Renault, fabricante que conquistou dois títulos mundiais de construtores em 2005 e 2006. A equipe passou a competir com o nome Alpine em 2021, utilizando a categoria para divulgar sua marca esportiva. Ao longo de sua trajetória, enfrentou diferentes fases, alternando bons resultados com períodos de dificuldades. Em 2026, seus pilotos são Pierre Gasly e Franco Colapinto. Até o GP de Singapura, a Alpine não havia conquistado vitórias em Grandes Prêmios na temporada e acumulava 68 pontos no campeonato de construtores. Apesar de ainda não possuir títulos mundiais de construtores com o nome Alpine, a equipe tem uma história ligada às conquistas da Renault e busca melhorar seus resultados na categoria.', 'assets/img/equipes/alpine.jpg'),
(8, 'Williams', 'Reino Unido', 'Grove, Inglaterra', 'A Williams é uma das equipes mais tradicionais da Fórmula 1, fundada por Frank Williams e Patrick Head. Ao longo de sua história, conquistou 9 títulos mundiais de construtores e teve grandes pilotos, como Nigel Mansell, Alain Prost, Damon Hill e Ayrton Senna. Durante as décadas de 1980 e 1990, destacou-se por sua engenharia avançada e por seus carros competitivos. Entretanto, nas últimas décadas, enfrentou dificuldades financeiras e esportivas, ficando distante das primeiras posições. Em 2026, seus pilotos são Alexander Albon e Carlos Sainz. Até o GP de Singapura, a Williams não havia conquistado vitórias em Grandes Prêmios na temporada e somava 12 pontos no campeonato de construtores. Apesar dos desafios, seu legado continua sendo uma parte importante da história do automobilismo.', 'Williams 2026', 'O Williams FW48 utiliza diferentes tons de azul, acompanhados de detalhes brancos e pretos. Seu motor Mercedes V6 turbo híbrido combina combustão e energia elétrica tendo sua potência de aproximadamente 476 cv. O carro possui estrutura de fibra de carbono, suspensão de competição e aerodinâmica ativa. Esses componentes ajudam a melhorar a estabilidade, reduzir a resistência do ar e aproveitar melhor a energia disponível durante as corridas.', 'assets/img/equipes/williams.jpg'),
(9, 'Haas F1 Team', 'Estados Unidos', 'Kannapolis, Carolina do Norte', 'A Haas é uma equipe norte-americana que estreou na Fórmula 1 em 2016, tornando-se uma das representantes dos Estados Unidos na categoria. Mesmo enfrentando dificuldades para competir com equipes que possuem orçamentos maiores, conseguiu conquistar resultados importantes ao longo de sua trajetória. A Haas é conhecida por buscar eficiência no desenvolvimento do carro e por trabalhar com uma estrutura relativamente enxuta. Em 2026, seus pilotos são Esteban Ocon e Oliver Bearman. Até o GP de Singapura, a Haas não havia conquistado vitórias em Grandes Prêmios na temporada e somava 30 pontos no campeonato de construtores. A equipe ainda não conquistou títulos mundiais de construtores, mas procura evoluir tecnicamente, aproveitar as oportunidades durante as corridas e conquistar melhores posições.', 'Haas 2026', 'O Haas VF-26 combina branco, preto e vermelho em seu design. Seu conjunto mecânico utiliza uma unidade de potência Ferrari de aproximadamente 476 cv, com motor V6 turbo híbrido e sistema elétrico. O chassi de fibra de carbono, os freios de competição e a aerodinâmica ativa foram projetados para garantir resistência, estabilidade e eficiência em diferentes circuitos.', 'assets/img/equipes/haas.jpg'),
(10, 'Audi', 'Alemanha', 'Hinwil, Suíça', 'A Audi entrou oficialmente na Fórmula 1 em 2026, assumindo a estrutura da antiga equipe Sauber. A chegada da fabricante alemã representa um novo capítulo em sua história no automobilismo, pois a marca já conquistou importantes resultados em competições como o Campeonato Mundial de Endurance e o Rally Dakar. Na Fórmula 1, a Audi pretende utilizar sua experiência em engenharia e tecnologia para desenvolver um carro competitivo. Seus pilotos são Nico Hülkenberg e Gabriel Bortoleto, que combinam experiência internacional e juventude. Até o GP de Singapura, a Audi não havia conquistado vitórias em Grandes Prêmios na temporada e acumulava 23 pontos no campeonato de construtores. Por ser uma nova equipe de fábrica na categoria, enfrenta o desafio de desenvolver seus equipamentos e construir uma estrutura capaz de competir com as equipes mais experientes.', 'Audi 2026', 'O Audi R26 marca a estreia da fabricante alemã como equipe de fábrica na Fórmula 1 em 2026. Sua pintura combina preto, prata e vermelho. O carro utiliza uma unidade de potência própria de aproximadamente 476 cv, com motor V6 turbo híbrido, e possui chassi de fibra de carbono, suspensão de competição e aerodinâmica ativa. A integração entre motor e sistema elétrico é fundamental para seu desempenho.', 'assets/img/equipes/audi.jpg'),
(11, 'Cadillac', 'Estados Unidos', 'Silverstone, Inglaterra', 'A Cadillac é a nova equipe norte-americana da Fórmula 1 em 2026, ampliando o grid de dez para onze equipes. Ligada à General Motors, a marca chegou à categoria para fortalecer sua presença internacional no automobilismo e demonstrar sua capacidade tecnológica. Sua entrada também representa uma oportunidade de aumentar o interesse pela Fórmula 1 nos Estados Unidos. Seus pilotos são Sergio Pérez e Valtteri Bottas, ambos experientes e com passagens por outras equipes da categoria. Até o GP de Singapura, a Cadillac ainda não havia conquistado vitórias em Grandes Prêmios e permanecia com 0 pontos no campeonato de construtores. Como estreante, enfrenta o desafio de desenvolver seu carro, aperfeiçoar sua estrutura e conquistar seus primeiros resultados na Fórmula 1.', 'Cadillac 2026', 'O Cadillac MAC-26 é o carro da equipe norte-americana em sua estreia na Fórmula 1. Sua pintura combina preto e branco, destacando a identidade da marca. O monoposto utiliza uma unidade de potência Ferrari de aproximadamente 476 cv, com motor V6 turbo híbrido de 1,6 litro. Sua estrutura de fibra de carbono, a suspensão de competição e a aerodinâmica ativa são fundamentais para garantir segurança, estabilidade e eficiência.', 'assets/img/equipes/cadillac.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pilotos`
--

CREATE TABLE `pilotos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `numero` int(11) NOT NULL,
  `nacionalidade` varchar(80) NOT NULL,
  `sobre` text NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `equipe_id` int(11) NOT NULL,
  `podios` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vitorias` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pole_positions` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pontos_carreira` decimal(10,1) NOT NULL DEFAULT 0.0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `pilotos`
--

INSERT INTO `pilotos` (`id`, `nome`, `numero`, `nacionalidade`, `sobre`, `imagem`, `equipe_id`, `podios`, `vitorias`, `pole_positions`, `pontos_carreira`) VALUES
(1, 'Lando Norris', 1, 'Britânica', 'Lando Norris é um piloto britânico que construiu sua carreira na Fórmula 1 defendendo a McLaren, equipe pela qual estreou em 2019. Conhecido pela velocidade em classificações, pela habilidade nas disputas roda a roda e pela capacidade de extrair desempenho do carro, conquistou sua primeira vitória em 2024. Em 2025, alcançou o maior título de sua carreira ao se tornar campeão mundial, consolidando seu nome entre os principais pilotos da categoria.', 'assets/img/pilotos/lando-mclaren.avif', 1, 49, 49, 19, 1631.0),
(2, 'Oscar Piastri', 81, 'Australiana', 'Oscar Piastri é um piloto australiano que se destacou nas categorias de base antes de chegar à Fórmula 1 em 2023. Conquistou títulos na Fórmula 3 e na Fórmula 2 em temporadas consecutivas, demonstrando velocidade, consistência e capacidade de adaptação. Na McLaren, tornou-se um competidor importante nas disputas por vitórias e pontos, chamando a atenção pelo estilo de pilotagem calculado e pela maturidade nas corridas.', 'assets/img/pilotos/oscar-mclaren.avif', 1, 28, 28, 6, 937.0),
(3, 'George Russell', 63, 'Britânica', 'George Russell é um piloto britânico conhecido pela precisão nas classificações e pela consistência ao longo das corridas. Antes de chegar à Mercedes, competiu pela Williams, onde demonstrou seu potencial mesmo com um carro que nem sempre permitia disputar as primeiras posições. Sua primeira vitória na Fórmula 1 veio em 2022, no Grande Prêmio de São Paulo, e sua experiência técnica e capacidade de trabalhar com a equipe fazem dele uma peça importante na Mercedes.', 'assets/img/pilotos/george-mercedes.avif', 2, 32, 32, 13, 1271.0),
(4, 'Kimi Antonelli', 12, 'Italiana', 'Andrea Kimi Antonelli é um piloto italiano que chegou à Fórmula 1 após se destacar no kartismo e conquistar resultados expressivos nas categorias de formação. Seu progresso rápido chamou a atenção da Mercedes, que apostou em seu potencial para competir no mais alto nível do automobilismo. Apesar da pouca idade, Antonelli demonstra velocidade e coragem nas disputas, enquanto desenvolve a experiência necessária para enfrentar circuitos diferentes e administrar a pressão da categoria.', 'assets/img/pilotos/kimi-mercedes.avif', 2, 17, 17, 6, 490.0),
(5, 'Charles Leclerc', 16, 'Monegasca', 'Charles Leclerc é um piloto monegasco reconhecido pela velocidade em voltas rápidas e pela capacidade de buscar posições competitivas nas classificações. Antes de chegar à Ferrari, conquistou o campeonato da Fórmula 2 em 2017 e estreou na Fórmula 1 pela Sauber em 2018. Desde que passou a defender a Ferrari, tornou-se um dos principais representantes da equipe, acumulando pole positions, vitórias e pódios, além de manter uma forte ligação com o time italiano.', 'assets/img/pilotos/charles-ferrari.avif', 3, 55, 55, 27, 1887.0),
(6, 'Lewis Hamilton', 44, 'Britânica', 'Lewis Hamilton é um piloto britânico considerado um dos maiores nomes da história da Fórmula 1. Ao longo de sua carreira, conquistou sete campeonatos mundiais e estabeleceu recordes de vitórias e pole positions. Depois de uma trajetória histórica na Mercedes, passou a defender a Ferrari, levando para a equipe italiana sua experiência, capacidade de leitura de corrida e conhecimento técnico. Sua habilidade para administrar pneus, aproveitar oportunidades e competir sob pressão continua sendo uma característica marcante.', 'assets/img/pilotos/lewis-ferrari.avif', 3, 208, 208, 104, 52475.0),
(7, 'Max Verstappen', 3, 'Neerlandesa', 'Max Verstappen é um piloto neerlandês conhecido pelo estilo agressivo, pela velocidade e pela capacidade de disputar posições com grande determinação. Estreou na Fórmula 1 ainda adolescente e conquistou sua primeira vitória em 2016, tornando-se o vencedor mais jovem de um Grande Prêmio na história da categoria. Com múltiplos títulos mundiais, construiu uma reputação de competidor extremamente difícil de superar, especialmente quando encontra um bom equilíbrio entre o carro, os pneus e as condições da pista.', 'assets/img/pilotos/max-redbull.avif', 4, 136, 136, 50, 36655.0),
(8, 'Isack Hadjar', 6, 'Francesa', 'Isack Hadjar é um piloto francês de ascendência argelina que avançou pelas categorias de base até conquistar uma vaga na Fórmula 1. Sua trajetória inclui disputas importantes na Fórmula 3 e na Fórmula 2, nas quais demonstrou velocidade e capacidade de competir contra adversários experientes. Após chamar a atenção na Racing Bulls, recebeu a oportunidade de defender a Red Bull Racing. Seu desafio é transformar o potencial demonstrado em resultados consistentes e acompanhar o ritmo de uma equipe que frequentemente disputa as primeiras posições.', 'assets/img/pilotos/isack-redbull.avif', 4, 3, 3, 0, 148.0),
(9, 'Liam Lawson', 30, 'Neozelandesa', 'Liam Lawson é um piloto neozelandês que construiu sua trajetória em diferentes categorias internacionais antes de chegar à Fórmula 1. Sua passagem pela equipe júnior da Red Bull proporcionou oportunidades de demonstrar velocidade, capacidade de adaptação e competitividade em situações de pressão. Conhecido por seu estilo combativo, Lawson busca aproveitar cada corrida para acumular pontos, aperfeiçoar seu desempenho e consolidar sua posição na categoria.', 'assets/img/pilotos/liaw-racing.avif', 5, 0, 0, 0, 119.0),
(10, 'Arvid Lindblad', 41, 'Britânica', 'Arvid Lindblad é um piloto britânico que chegou à Fórmula 1 após se destacar no automobilismo de base, especialmente nas categorias de monopostos. Integrante do programa de jovens pilotos da Red Bull, avançou rapidamente pelas etapas de formação e recebeu a oportunidade de estrear na categoria principal em 2026. Como estreante, seu principal objetivo é desenvolver consistência, aprender com os profissionais mais experientes e demonstrar seu potencial ao longo de uma temporada exigente.', 'assets/img/pilotos/arvid-racing.avif', 5, 0, 0, 0, 38.0),
(11, 'Fernando Alonso', 14, 'Espanhola', 'ernando Alonso é um piloto espanhol com uma das carreiras mais longas e reconhecidas da Fórmula 1. Campeão mundial em 2005 e 2006, destacou-se pela inteligência estratégica, pela capacidade de defender posições e pela habilidade de extrair o máximo de diferentes carros. Ao longo de sua trajetória, competiu por equipes importantes e acumulou grande experiência em circuitos de todo o mundo. Na Aston Martin, sua leitura de corrida e seu conhecimento técnico são recursos valiosos para o desenvolvimento do carro.', 'assets/img/pilotos/fernando-aston.avif', 6, 106, 106, 22, 2400.0),
(12, 'Lance Stroll', 18, 'Canadense', 'Lance Stroll é um piloto canadense que chegou à Fórmula 1 após conquistar títulos nas categorias de base, incluindo o campeonato europeu de Fórmula 3 em 2016. Desde sua estreia, acumulou pódios e demonstrou capacidade de aproveitar oportunidades em condições desafiadoras, como corridas com chuva. Na Aston Martin, trabalha para melhorar a regularidade dos resultados e contribuir para o desenvolvimento da equipe, combinando experiência na categoria com conhecimento do funcionamento do time.\r\nAlpine', 'assets/img/pilotos/lance-aston.avif', 6, 3, 3, 1, 325.0),
(13, 'Pierre Gasly', 10, 'Francesa', 'Pierre Gasly é um piloto francês que conquistou reconhecimento internacional por sua velocidade e determinação. Antes de chegar à Fórmula 1, percorreu as categorias de base e conquistou o título da GP2, atual Fórmula 2, em 2016. Sua vitória no Grande Prêmio da Itália de 2020, pela AlphaTauri, marcou um dos momentos mais importantes de sua carreira. Na Alpine, utiliza sua experiência para orientar o desenvolvimento do carro, buscar pontos e aproveitar oportunidades de alcançar posições de destaque.', 'assets/img/pilotos/pierre-alpine.avif', 7, 5, 5, 1, 499.0),
(14, 'Franco Colapinto', 43, 'Argentina', 'Franco Colapinto é um piloto argentino que ganhou destaque internacional por seus resultados nas categorias de base e por sua chegada à Fórmula 1. Antes de competir na categoria principal, participou de campeonatos como a Fórmula 3 e a Fórmula 2, desenvolvendo experiência em circuitos de diferentes características. Conhecido por sua determinação e por sua capacidade de disputar posições, Colapinto representa uma nova geração de pilotos sul-americanos que busca conquistar espaço e estabelecer uma carreira duradoura no automobilismo mundial.', 'assets/img/pilotos/franco-alpine.avif', 7, 0, 0, 0, 32.0),
(15, 'Carlos Sainz', 55, 'Espanhola', 'Carlos Sainz é um piloto espanhol conhecido pela consistência, pela inteligência estratégica e pela capacidade de compreender o comportamento do carro. Ao longo da carreira, defendeu equipes como Toro Rosso, Renault, McLaren e Ferrari, acumulando vitórias e experiência em diferentes projetos técnicos. Sua passagem por equipes competitivas contribuiu para desenvolver sua habilidade de trabalhar com engenheiros e tomar decisões durante as corridas. Na Williams, sua experiência é importante para fortalecer o desempenho coletivo e ajudar a equipe a avançar no grid.', 'assets/img/pilotos/carlos-williams.avif', 8, 29, 29, 6, 13435.0),
(16, 'Alexander Albon', 23, 'Tailandesa', 'Alexander Albon é um piloto tailandês-britânico que chegou à Fórmula 1 após conquistar bons resultados nas categorias de base. Teve sua primeira oportunidade na categoria com a Toro Rosso e posteriormente competiu pela Red Bull Racing antes de assumir um papel importante na Williams. É reconhecido por sua capacidade de extrair desempenho do carro, especialmente em classificações e corridas nas quais a equipe precisa superar adversários com mais recursos. Sua regularidade e experiência técnica fazem dele uma referência importante dentro da Williams.\r\nHaas', 'assets/img/pilotos/alexander-williams.avif', 8, 2, 2, 0, 318.0),
(17, 'Esteban Ocon', 31, 'Francesa', 'Esteban Ocon é um piloto francês que construiu sua carreira com determinação, passando por diferentes categorias até chegar à Fórmula 1. Conquistou o campeonato da GP3 em 2015 e o título da Fórmula 3 Europeia em 2014, demonstrando competitividade desde jovem. Na Fórmula 1, conquistou sua primeira vitória no Grande Prêmio da Hungria de 2021, resultado que marcou sua trajetória. Conhecido pela capacidade de defender posições e disputar corridas estratégicas, Ocon leva experiência para o trabalho da Haas.\r\n', 'assets/img/pilotos/esteban-hass.avif', 9, 4, 4, 0, 490.0),
(18, 'Oliver Bearman', 87, 'Britânica', 'Oliver Bearman é um piloto britânico que chamou a atenção por sua evolução nas categorias de base e por suas oportunidades precoces na Fórmula 1. Integrante da academia de jovens pilotos da Ferrari, destacou-se na Fórmula 2 e teve experiências importantes na categoria principal antes de assumir uma vaga permanente. Seu estilo de pilotagem combina velocidade e disposição para disputar posições, enquanto desenvolve a consistência necessária para competir em uma temporada completa. Na Haas, busca transformar seu potencial em resultados regulares.\r\n\r\n', 'assets/img/pilotos/oliver-hass.avif', 9, 0, 0, 0, 71.0),
(19, 'Nico Hülkenberg', 27, 'Alemã', 'Nico Hülkenberg é um piloto alemão reconhecido pela experiência, pela velocidade em classificações e pelo conhecimento técnico acumulado ao longo de várias temporadas na Fórmula 1. Antes de chegar à categoria principal, conquistou títulos na Fórmula 3 Europeia e na GP2, demonstrando grande potencial nas categorias de formação. Mesmo sem ter conquistado um pódio em suas primeiras longas passagens pela F1, manteve a reputação de piloto competitivo e consistente. Sua experiência é especialmente importante para o projeto da Audi e para o desenvolvimento do carro.\r\n', 'assets/img/pilotos/nico-audi.avif', 10, 1, 1, 1, 635.0),
(20, 'Gabriel Bortoleto', 5, 'Brasileira', 'Gabriel Bortoleto é um piloto brasileiro que ganhou destaque internacional ao conquistar os campeonatos da Fórmula 3 em 2023 e da Fórmula 2 em 2024. Seus resultados nas categorias de base demonstraram velocidade, regularidade e capacidade de administrar campeonatos longos. Ao chegar à Fórmula 1, tornou-se um representante importante do Brasil na principal categoria do automobilismo mundial. Na Audi, seu objetivo é evoluir tecnicamente, conquistar pontos e construir uma trajetória sólida diante de adversários experientes.\r\nCadillac\r\n', 'assets/img/pilotos/gabriel-audi.avif', 10, 0, 0, 0, 29.0),
(21, 'Sergio Pérez', 11, 'Mexicana', 'Sergio Pérez é um piloto mexicano conhecido pela gestão eficiente dos pneus, pela experiência em estratégias de corrida e pela capacidade de defender posições. Estreou na Fórmula 1 em 2011 e passou por equipes como Sauber, McLaren, Force India, Racing Point e Red Bull Racing. Ao longo de sua carreira, conquistou vitórias e pódios, tornando-se um dos pilotos mexicanos mais bem-sucedidos da história da categoria. Sua experiência em diferentes equipes e situações de corrida é um recurso importante em seu retorno ao grid com a Cadillac.', 'assets/img/pilotos/sergio-cadillac.avif', 11, 39, 39, 3, 1638.0),
(22, 'Valtteri Bottas', 77, 'Finlandesa', 'Valtteri Bottas é um piloto finlandês conhecido pela velocidade em classificações, pela precisão e pela experiência em equipes de alto desempenho. Durante sua passagem pela Mercedes, conquistou diversas vitórias e contribuiu para títulos de construtores, trabalhando ao lado de Lewis Hamilton. Posteriormente, competiu pela Alfa Romeo e pela Sauber, ampliando sua experiência em diferentes projetos técnicos. Com sua trajetória consolidada na Fórmula 1, Bottas leva conhecimento de desenvolvimento, estratégia e trabalho em equipe para a Cadillac.', 'assets/img/pilotos/valtteri-cadillac.avif', 11, 67, 67, 20, 1797.0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `recuperacao_senha`
--

CREATE TABLE `recuperacao_senha` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `token_hash` char(64) NOT NULL,
  `expira_em` datetime NOT NULL,
  `usado_em` datetime DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(190) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `ativo`, `criado_em`, `atualizado_em`) VALUES
(1, 'Bianca Silva', 'bianca.silva30sc@gmail.com', '$2y$10$UWHQ4JC3TWLVfzOnNkPNgeghQNu.lQxm4siWQ2oGwyf7zzaEBwt1W', 1, '2026-10-22 14:00:29', '2026-10-22 14:00:29');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_categorias_slug` (`slug`);

--
-- Índices de tabela `conteudos`
--
ALTER TABLE `conteudos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_conteudos_categoria_ativo` (`categoria_id`,`ativo`),
  ADD KEY `idx_conteudos_titulo` (`titulo`);

--
-- Índices de tabela `equipes`
--
ALTER TABLE `equipes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pilotos`
--
ALTER TABLE `pilotos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero` (`numero`),
  ADD KEY `fk_piloto_equipe` (`equipe_id`);

--
-- Índices de tabela `recuperacao_senha`
--
ALTER TABLE `recuperacao_senha`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_recuperacao_token` (`token_hash`),
  ADD KEY `idx_recuperacao_usuario` (`usuario_id`),
  ADD KEY `idx_recuperacao_expiracao` (`expira_em`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_usuarios_email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `conteudos`
--
ALTER TABLE `conteudos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de tabela `equipes`
--
ALTER TABLE `equipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `pilotos`
--
ALTER TABLE `pilotos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `recuperacao_senha`
--
ALTER TABLE `recuperacao_senha`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `conteudos`
--
ALTER TABLE `conteudos`
  ADD CONSTRAINT `fk_conteudos_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `pilotos`
--
ALTER TABLE `pilotos`
  ADD CONSTRAINT `fk_piloto_equipe` FOREIGN KEY (`equipe_id`) REFERENCES `equipes` (`id`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `recuperacao_senha`
--
ALTER TABLE `recuperacao_senha`
  ADD CONSTRAINT `fk_recuperacao_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
