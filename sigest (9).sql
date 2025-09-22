-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/09/2025 às 16:37
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
-- Banco de dados: `sigest`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nome_categoria` varchar(60) NOT NULL,
  `dt_criacao` varchar(50) NOT NULL,
  `dt_atualizacao` varchar(50) NOT NULL,
  `nivel_acesso` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nome_categoria`, `dt_criacao`, `dt_atualizacao`, `nivel_acesso`) VALUES
(1, 'ADMINISTRADOR', '2024-11-15 13:02:10', '2024-11-15 13:02:10', '1'),
(2, 'DIRETOR GERAL', '2024-11-15 13:02:10', '2024-11-15 13:02:10', '1'),
(3, 'DIRETOR ADJUNTO', '2024-11-15 13:02:10', '2024-11-15 13:02:10', '1'),
(5, 'Contabilidade', '2024-11-15 13:02:10', '2024-11-15 13:02:10', '1'),
(10, 'GGA', '2024-11-18-08:40:40', '', '1'),
(11, 'GESTOR', '2024-11-18-09:29:40', '', '1'),
(12, 'ADMINISTRATIVO', '2024-11-18-11:06:36', '', '1'),
(13, 'DIRETOR', '2024-11-18-14:51:13', '', '1'),
(14, 'GERENTE', '2024-11-20-08:34:43', '', '1'),
(20, 'PORTARIA', '2024-11-26-17:45:42', '', '1'),
(26, 'ALUNO', '2024-11-29-08:05:45', '', '4'),
(29, 'COORDENADOR', '2024-11-29-08:40:32', '', '3'),
(30, 'SECRETARIA', '2024-11-29-08:42:37', '', '2'),
(31, 'PROFESSOR', '2024-11-29-10:08:38', '', '5');

-- --------------------------------------------------------

--
-- Estrutura para tabela `classe`
--

CREATE TABLE `classe` (
  `id_classe` int(11) NOT NULL,
  `nome_classe` varchar(50) NOT NULL,
  `data_criado_classe` datetime DEFAULT current_timestamp(),
  `data_modificado_turma` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `criado_por` int(11) DEFAULT NULL,
  `modificado_por` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `classe`
--

INSERT INTO `classe` (`id_classe`, `nome_classe`, `data_criado_classe`, `data_modificado_turma`, `criado_por`, `modificado_por`) VALUES
(1, '13ª CLASSE', '2025-02-16 07:00:15', NULL, 2, NULL),
(2, '12ª CLASSE', '2025-02-16 07:00:29', NULL, 2, NULL),
(3, '11ª CLASSE', '2025-02-16 07:00:46', NULL, 2, NULL),
(4, '10ª CLASSE', '2025-02-16 07:01:02', NULL, 2, NULL),
(5, '3ª CLASSE', '2025-02-16 11:06:41', NULL, 77, NULL),
(6, '4ª CLASSE', '2025-02-16 11:07:16', NULL, 77, NULL),
(7, '8ªCLASSE', '2025-02-16 11:13:55', NULL, 77, NULL),
(8, '6ª CLASSE', '2025-02-16 11:20:40', NULL, 77, NULL),
(9, '7ª CLASSE', '2025-02-16 16:57:22', NULL, 77, NULL),
(10, '1ª CLASSE', '2025-02-16 22:07:17', NULL, 2, NULL),
(11, '2ª CLASSE', '2025-02-18 21:19:50', NULL, 2, NULL),
(12, '13ª CLASSE', '2025-02-18 22:08:53', NULL, 2, NULL),
(14, '5ªCLASSE', '2025-02-22 14:30:23', NULL, 77, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplinas`
--

CREATE TABLE `disciplinas` (
  `id_disciplina` int(11) NOT NULL,
  `disciplina_nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `disciplinas`
--

INSERT INTO `disciplinas` (`id_disciplina`, `disciplina_nome`) VALUES
(1, 'Matematica'),
(2, 'Fisica'),
(3, 'Lingua Portuguesa'),
(4, 'Educação Moral Civica'),
(5, 'Redes de Computadores I'),
(6, 'Redes de Computadores II'),
(7, 'Eletronica'),
(8, 'Sistemas Informaticos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `inscricao`
--

CREATE TABLE `inscricao` (
  `id_inscricacao` int(11) NOT NULL,
  `nome_aluno` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contacto` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dataNascCandidato` date NOT NULL,
  `numero_bi` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sexoCandidato` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `estadoCandidato` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NacionalidadeCandidato` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `provincia_nasc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `municipio_nasc` varchar(60) NOT NULL,
  `provincia_reside` varchar(60) NOT NULL,
  `municipio_reside` varchar(60) DEFAULT NULL,
  `morada` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classeCandidato` int(2) NOT NULL,
  `pai_candidato` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mae_candidato` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contactoEncarregado` int(9) NOT NULL,
  `escola_ant` varchar(50) NOT NULL,
  `ano_saida` year(4) NOT NULL,
  `classe_freq_escAnt` int(2) NOT NULL,
  `turma_frequentada` varchar(4) NOT NULL,
  `dataCadastro` date NOT NULL,
  `dataModificacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `inscricao`
--

INSERT INTO `inscricao` (`id_inscricacao`, `nome_aluno`, `email`, `contacto`, `dataNascCandidato`, `numero_bi`, `sexoCandidato`, `estadoCandidato`, `NacionalidadeCandidato`, `provincia_nasc`, `municipio_nasc`, `provincia_reside`, `municipio_reside`, `morada`, `classeCandidato`, `pai_candidato`, `mae_candidato`, `contactoEncarregado`, `escola_ant`, `ano_saida`, `classe_freq_escAnt`, `turma_frequentada`, `dataCadastro`, `dataModificacao`) VALUES
(1, 'ffafafafa', 'dafa180086@gmail.com', '792727', '2024-12-03', '1189891289', 'Masculino', 'casado', 'angola', 'Luanda', 'Cacuaco', 'Luanda', 'Talatona', 'Jardim Édem', 10, 'Fernando Monteiro Daniel', 'Fernando Monteiro Daniel', 99282828, 'MBC', '2023', 8, 'MA', '2024-12-18', '0000-00-00'),
(2, 'Maria Kiala', 'mariakiala@gmail.com', '792727', '2024-12-02', '1189891LA090', 'Femenino', 'casado', 'angola', 'Luanda', '', '', '', 'Jardim Édem', 10, 'Fernando Monteiro Daniel', 'Fernando Monteiro Daniel', 93883838, '2030', '2023', 8, 'MA', '2024-12-18', '0000-00-00'),
(4, 'rwrwr', 'Artur@gmail.com', '92727601', '2025-01-02', '09388KS011', 'Masculino', 'solteiro', 'angola', 'Luanda', '', '', '', 'Golfe', 10, 'Jorge', 'Margarida', 2147483647, 'PEDALE', '2012', 8, 'MA', '2025-01-24', '0000-00-00'),
(6, 'Hugo Chaves ', 'hugochaves@gmail.com', '927807600', '2025-01-10', '009388MO012', 'Masculino', 'solteiro', 'angola', 'Luanda', '', '', '', '11 de Novembro', 8, 'Chaves', 'Luisa', 1919299, '11 de Novembro', '2020', 7, 'MM', '2025-01-24', '0000-00-00'),
(7, 'Anastacio', 'anastaciog@gmail.com', '180086', '2025-01-01', '180086LA00', 'M', 'Solteiro', 'Angolana', 'Luanda', '', '', '', 'Avo Kumbi', 12, 'Muhongo', 'Carla', 180098, '11 de Novembro', '2020', 11, 'TA', '2025-01-13', '0000-00-00'),
(10, 'Paulina', 'paulina@gmail.com', '180088', '2025-01-01', '180088LA00', 'M', 'Solteira', 'Angolana', 'Luanda', '', '', '', 'KK', 1, 'Luindula', 'Maria', 18009081, '11 de Novembro', '2020', 10, 'MA', '2025-01-13', '0000-00-00'),
(13, 'Janeth', 'jane@gmail.com', '9838383', '2025-02-01', '983737LA098', 'Femenino', 'solteiro', 'angola', 'Luanda', '', '', '', 'Jardim Édem', 3, 'Antonio', 'Ana', 99998837, 'Pitruca', '2025', 4, 'MC', '2025-02-17', '0000-00-00'),
(15, 'ANA UMBA', 'umba@gmail.com', '', '0000-00-00', '11898LA2333', 'masculino', 'Solteiro', 'angola', 'Luanda', '', '', '', 'CM85+25Q, Caxito', 2, 'umba g', 'pai', 77, 'MBC', '2023', 3, 'MA', '2025-03-20', '0000-00-00'),
(16, 'IGOR SANTANA', 'iGOR@gmail.com', '923 456-6', '0000-00-00', '1189891LA001', 'masculino', 'Solteiro', 'angola', 'Luanda', '', '', '', 'Distrito do Vila Flor', 9, 'SANTANA', 'pai', 92, 'MBC', '2023', 8, 'MA', '2025-03-20', '0000-00-00'),
(17, 'Olga Pedro', 'olga@gmail.com', '924 342-4', '0000-00-00', '00202000LA009', 'feminino', 'Solteiro', 'angola', 'Luanda', '', '', '', 'Jardim Édem', 3, 'Pedro Vicente', 'pai', 2147483647, 'MBC', '2023', 4, 'MA', '2025-04-03', '0000-00-00'),
(18, 'LUDI ANTONIA MONTEIRO FIN', 'ludi@gmail.com', '9272762-6', '0000-00-00', '00000023UG290', 'feminino', 'Solteiro', 'angola', 'Uige', '', '', '', 'Jardim Édem', 7, 'Augusto Vieira ', 'Tio', 92323202, 'Pitruca', '2022', 9, 'MA', '2025-04-05', '0000-00-00'),
(19, 'Chita', 'ch@gmail.com', '234 44', '2002-11-12', '11222LA98', 'feminino', 'Solteiro', 'angola', 'Luanda', '', '', '', 'Paviterra', 1, 'Dario', 'pai', 2147483647, 'MBC', '0000', 2, 'ma', '2025-06-13', '2025-06-13'),
(20, 'Samuel', 'samuel@gmail.com', '9797698', '2002-11-12', '0012LA98', 'masculino', 'Solteiro', 'angola', 'Luanda', '', '', '', 'Rocha', 3, 'Adao', 'Tio', 92, 'MBC', '2020', 4, 'ma', '2025-08-06', '2025-08-06'),
(21, 'Nuncia M', 'nuncia@gmail.com', '9797600', '2000-02-20', '11222HL98', 'feminino', 'Solteiro', 'angola', 'Benguela', 'Lobito', '', '', 'Caala', 1, 'Malungo', 'pai', 2449541, 'Punivel Caala', '2020', 3, 'MA', '2025-09-18', '2025-09-18'),
(22, 'Betiane', 'beth@gmail.com', '955 667', '1996-02-20', '009822LA98', 'feminino', 'Solteiro', 'angola', 'Luanda', 'Kilamba Kiaxi', 'Luanda', 'Kilamba', '11 de Novembro', 3, 'Pedro', 'pai', 97, 'Punivel kilamba', '2020', 4, 'MA', '2025-09-18', '2025-09-18'),
(23, 'Zua', 'zua@gmail.com', '456 566', '2002-11-12', '002444LA0970', 'masculino', 'Solteiro', 'angola', 'Luanda', 'Talatona', 'Benguela', 'Lobito', 'Zambia', 4, 'Antonio', 'pai', 99, 'Punivel Benguela', '2020', 8, 'MA', '2025-09-18', '2025-09-18'),
(24, 'Paula', 'paula@gmail.com', '963 635-6', '1999-11-20', '000045LA98', 'feminino', 'Solteiro', 'angola', 'Luanda', 'Belas', 'Uige', 'Uige', 'Catapa', 2, 'Luindula', 'pai', 92, 'Punivel Uige', '2020', 3, 'MB', '2025-09-19', '2025-09-19'),
(25, 'Adolfe Mutema', 'mutema@gmail.com', '333 344', '1997-08-12', '02020LA0034', 'masculino', 'Solteiro', 'angola', 'Luanda', 'Kilamba Kiaxi', 'K.Sul', 'Sumbe', 'Sumbe', 8, 'Mutema', 'pai', 99, 'Punivel Sumbe', '2020', 14, 'MA', '2025-09-19', '2025-09-19');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `id_pagamento` int(11) NOT NULL,
  `id_aluno_key` int(11) NOT NULL,
  `pagamento_referente` int(11) NOT NULL,
  `ano_pagamento` int(5) NOT NULL,
  `numero_recibo` int(11) NOT NULL,
  `valor_pagamento` int(11) NOT NULL,
  `dataPagamento` date NOT NULL,
  `criado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pagamentos`
--

INSERT INTO `pagamentos` (`id_pagamento`, `id_aluno_key`, `pagamento_referente`, `ano_pagamento`, `numero_recibo`, `valor_pagamento`, `dataPagamento`, `criado_por`) VALUES
(3, 41, 1, 2024, 123, 2000, '2025-04-12', 77),
(4, 41, 3, 2024, 123, 6500, '2025-04-12', 77),
(17, 50, 1, 2024, 34222, 9000, '2025-11-09', 77),
(18, 50, 3, 2024, 34222, 30000, '2025-11-09', 77),
(19, 51, 1, 2024, 1245, 9000, '2025-04-21', 77),
(20, 51, 3, 2024, 1245, 30000, '2025-04-21', 77),
(21, 52, 1, 2024, 2312, 9000, '2025-06-12', 77),
(22, 52, 3, 2024, 2312, 30000, '2025-06-12', 77);

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor`
--

CREATE TABLE `professor` (
  `ID` int(11) NOT NULL,
  `nome` varchar(25) NOT NULL,
  `apelido` varchar(25) NOT NULL,
  `BI` varchar(13) NOT NULL,
  `naturalidade` varchar(20) NOT NULL,
  `pais` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(40) NOT NULL,
  `contacto` bigint(11) NOT NULL,
  `sexo` varchar(15) NOT NULL,
  `estado` varchar(9) NOT NULL,
  `bairro` varchar(20) NOT NULL,
  `data_cadastro` date NOT NULL,
  `data_modif` date NOT NULL,
  `id_user_key` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `professor`
--

INSERT INTO `professor` (`ID`, `nome`, `apelido`, `BI`, `naturalidade`, `pais`, `dob`, `email`, `contacto`, `sexo`, `estado`, `bairro`, `data_cadastro`, `data_modif`, `id_user_key`) VALUES
(1, 'Iboni Simao', 'Ibony', '6633535LA043', 'Luanda', 'Angola', '1999-12-01', 'ibony@gmail.com', 928282882, 'Masculino', 'casado', 'Killamba', '2024-12-02', '0000-00-00', 78),
(4, 'Aristoteles', 'Ary Alda', '262625LA200', 'Luanda', 'angola', '2024-12-03', 'ary@gmail.com', 7927279, 'angola', 'casado', 'CM85+25Q, Caxito', '2024-12-19', '2024-12-19', 93),
(10, 'Soto ', 'AAA', '2628885LA200', 'Luanda', 'angola', '2024-12-05', 'soto@gmail.com', 79273488, 'angola', 'casado', 'Gamek', '2024-12-20', '2024-12-20', 80),
(15, 'Fuaxa', 'Fuaxa', '092288LA008', 'Luanda', 'angola', '2024-11-26', 'fuaxa.fuaxa@gmail.com', 927272088, 'angola', 'casado', 'Benfica', '2024-12-22', '2024-12-22', 105),
(16, 'Edmuene', 'MM', '092128LA008', 'Luanda', 'angola', '2024-11-26', 'mm@gmmail.com', 932333, 'Masculino', 'casado', 'kk', '2024-12-22', '2024-12-22', 106),
(17, 'Mario de Lemos', 'ML', '0059111LA011', 'Luanda', 'angola', '2025-01-02', 'mariolm@gmail.com', 978667, 'Masculino', 'casado', 'Golfe', '2025-01-28', '2025-01-28', 120),
(18, 'Queiroz', 'QZ', '828828QZ090', 'Luanda', 'angola', '2025-02-06', '', 2323222, 'angola', 'solteiro', 'Fubu', '2025-02-04', '2025-02-04', 123),
(19, 'FRANCISCO PINTO', 'PINTO', '00987FG000', 'Luanda', 'angola', '2025-02-05', '', 8387777, 'angola', 'casado', 'Talatona', '2025-02-17', '2025-02-17', 0),
(20, 'Helder Mualunga', 'Helder', '8767278la', 'Luanda', 'angola', '2025-01-29', '', 93983989, 'angola', 'casado', 'Talatona', '2025-02-18', '2025-02-18', 126),
(21, 'Fernando ', 'Monteiro Daniel', '8767278la121', 'Luanda', 'angola', '2025-01-30', 'daniel@gmail.com', 95333, 'Masculino', 'casado', 'golf', '2025-02-18', '2025-02-18', 127),
(22, 'Simão Garcia SG', '', '092223LA008', 'Luanda', 'angola', '2025-01-29', '', 0, 'angola', 'casado', '', '2025-02-22', '2025-02-22', 128),
(23, 'Jose Martins', 'Jose', '986543la121', 'Luanda', 'angola', '1999-12-12', 'j.martins@gmail.com', 912322, 'angola', 'solteiro', 'ilha', '2025-06-11', '2025-06-11', 199),
(24, 'Bangs', 'Wagui', '082827HL', 'Luanda', 'angola', '1992-08-10', 'bang@gmail.com', 8282828, 'angola', 'casado', 'Jardim Édem', '2025-09-19', '2025-09-19', 201),
(25, 'Santos', 'Silas', '0000LA0032', 'Luanda', 'angola', '2000-11-12', '', 91234, 'angola', 'casado', 'Jardim Édem', '2025-09-19', '2025-09-19', 202);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbl_aluno`
--

CREATE TABLE `tbl_aluno` (
  `id_aluno` int(11) NOT NULL,
  `id_user_key` int(11) NOT NULL,
  `nome` varchar(25) NOT NULL,
  `apelido` varchar(25) DEFAULT NULL,
  `numero_processo` varchar(10) NOT NULL,
  `email` varchar(250) NOT NULL,
  `contacto` varchar(9) NOT NULL,
  `dataNascimento` date NOT NULL,
  `numeroBI` varchar(13) NOT NULL,
  `sexo` varchar(9) NOT NULL,
  `estadoCivil` varchar(8) NOT NULL,
  `pais` varchar(255) NOT NULL,
  `naturalidade` varchar(50) NOT NULL,
  `morada` varchar(100) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `pai` varchar(50) NOT NULL,
  `mae` varchar(50) NOT NULL,
  `contactoEncarregado` int(9) NOT NULL,
  `dataCadastro` date NOT NULL,
  `dataModificacao` date NOT NULL,
  `status` enum('Activo','Pendente','Bloqueado') NOT NULL DEFAULT 'Activo',
  `url_foto` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tbl_aluno`
--

INSERT INTO `tbl_aluno` (`id_aluno`, `id_user_key`, `nome`, `apelido`, `numero_processo`, `email`, `contacto`, `dataNascimento`, `numeroBI`, `sexo`, `estadoCivil`, `pais`, `naturalidade`, `morada`, `categoria_id`, `pai`, `mae`, `contactoEncarregado`, `dataCadastro`, `dataModificacao`, `status`, `url_foto`) VALUES
(1, 88, 'Isabel Eduardo', 'Bela', '20240001', 'isabel@gmail.com', '928282882', '2024-12-02', '005912074LA04', 'feminino', 'casado', 'Angola', 'Luanda', 'Golfe', 26, 'Artur', 'Madalena', 929383, '2024-12-03', '2024-12-04', 'Activo', ''),
(2, 92, 'Zaqueu Neto', 'Neto', '20240002', 'zaqueu@gmail.com', '927373737', '2024-12-02', '000092288LA90', 'Masculino', 'Casado', 'Angola', '', 'Viana', 26, 'Neto', 'Luisa', 8276352, '2024-12-03', '0000-00-00', 'Activo', ''),
(3, 79, 'Fernando', 'M', '20240003', 'fernando@gmail.com', '98288', '2024-12-02', '928838LA020', '', '', 'Angola', '', 'Luanda', 26, 'Mendes', 'Delfina', 999999, '2024-12-03', '0000-00-00', 'Activo', ''),
(5, 77, 'Maria Texeira', 'Mary', '20240005', 'mariatexeira@gmail.com', '923333', '2025-01-02', '005912074LA00', 'feminino', 'solteira', 'Angola', 'Luanda', 'Maianga', 26, 'Texeira', 'Marta', 929888, '2025-01-08', '0000-00-00', 'Activo', ''),
(9, 156, 'IGOR SANTANA', NULL, '20240006', 'iGOR@gmail.com', '923 456-6', '0000-00-00', '1189891LA001', 'masculino', 'Solteiro', 'angola', 'Luanda', 'Distrito do Vila Flor', 26, 'SANTANA', 'pai', 92, '2025-03-28', '2025-03-28', 'Activo', NULL),
(33, 180, 'ANA UMBA', NULL, '20240007', 'umba@gmail.com', '', '0000-00-00', '11898LA2333', 'masculino', 'Solteiro', 'angola', 'Luanda', 'CM85+25Q, Caxito', 26, 'umba g', 'pai', 77, '2025-04-01', '2025-04-01', 'Activo', NULL),
(41, 188, 'rwrwr', NULL, '20240008', 'Artur@gmail.com', '92727601', '2025-01-02', '09388KS011', 'Masculino', 'solteiro', 'angola', 'Luanda', 'Golfe', 26, 'Jorge', 'Margarida', 2147483647, '2025-04-05', '2025-04-05', 'Activo', NULL),
(50, 197, 'Paulina', NULL, '20240009', 'paulina@gmail.com', '180088', '2025-01-01', '180088LA00', 'M', 'Solteira', 'Angolana', 'Luanda', 'KK', 26, 'Luindula', 'Maria', 18009081, '2025-04-05', '2025-04-05', 'Activo', NULL),
(51, 198, 'Bartolomeu', NULL, '20240010', 'bartolomeu@gmail.com', '180088', '2025-01-01', '180088LA00', 'M', 'Solteira', 'Angolana', 'Luanda', 'KK', 26, 'Luindula', 'Maria', 18009081, '2025-04-05', '2025-04-05', 'Activo', NULL),
(52, 200, 'Wague', NULL, '20240011', 'w@gmail.com', '937 793-7', '0000-00-00', '373773WG909', 'masculino', 'Solteiro', 'angola', 'Luanda', 'Distrito do Vila Flor', 26, 'WAGUE RAUL', 'pai', 2147483647, '2025-06-12', '2025-06-12', 'Activo', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbl_alunos_turmas`
--

CREATE TABLE `tbl_alunos_turmas` (
  `id_aluno_turma` int(11) NOT NULL,
  `id_aluno_keys` int(11) NOT NULL,
  `id_turma_keys` int(11) NOT NULL,
  `dt_criacao` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbl_alunos_turmas`
--

INSERT INTO `tbl_alunos_turmas` (`id_aluno_turma`, `id_aluno_keys`, `id_turma_keys`, `dt_criacao`) VALUES
(5, 3, 7, '2025-02-17 08:27:06'),
(13, 1, 25, '2025-04-02'),
(14, 2, 25, '2025-04-02'),
(15, 3, 26, '2025-04-02'),
(16, 5, 26, '2025-17-02'),
(18, 5, 21, '2025-04-02'),
(19, 9, 25, '2024-11-24'),
(21, 33, 28, '2025-04-05'),
(22, 50, 25, '2025-04-05'),
(23, 51, 25, '2025-04-05'),
(24, 52, 25, '2025-06-12');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbl_configuracao`
--

CREATE TABLE `tbl_configuracao` (
  `nome` varchar(50) NOT NULL,
  `valor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbl_configuracao`
--

INSERT INTO `tbl_configuracao` (`nome`, `valor`) VALUES
('Ano Letivo Atual', '2024/2025');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbl_horarios`
--

CREATE TABLE `tbl_horarios` (
  `id_horario` int(11) NOT NULL,
  `id_rela_turma_prof_key` int(11) DEFAULT NULL,
  `dia_semana` enum('Segunda','Terça','Quarta','Quinta','Sexta') NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fim` time NOT NULL,
  `sala` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbl_notas`
--

CREATE TABLE `tbl_notas` (
  `id_nota` int(11) NOT NULL,
  `id_rela_turma_prof_key` int(11) DEFAULT NULL,
  `mac1` varchar(2) NOT NULL,
  `npp1` varchar(2) NOT NULL,
  `npt1` varchar(2) NOT NULL,
  `mt1` int(11) NOT NULL,
  `mac2` varchar(2) NOT NULL,
  `npp2` varchar(2) NOT NULL,
  `npt2` int(11) NOT NULL,
  `mt2` int(11) NOT NULL,
  `mac3` int(11) NOT NULL,
  `npp3` int(11) NOT NULL,
  `npt3` int(11) NOT NULL,
  `mt3` int(11) NOT NULL,
  `Trimestre` varchar(15) NOT NULL,
  `DataCadastro` date NOT NULL,
  `DataModificacao` date DEFAULT NULL,
  `id_aluno_key` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tbl_notas`
--

INSERT INTO `tbl_notas` (`id_nota`, `id_rela_turma_prof_key`, `mac1`, `npp1`, `npt1`, `mt1`, `mac2`, `npp2`, `npt2`, `mt2`, `mac3`, `npp3`, `npt3`, `mt3`, `Trimestre`, `DataCadastro`, `DataModificacao`, `id_aluno_key`) VALUES
(1, 12, '19', '', '', 0, '17', '', 0, 0, 18, 0, 0, 0, '', '2025-02-03', NULL, 1),
(2, 10, '15', '', '', 0, '17', '', 0, 0, 19, 0, 0, 0, '', '2025-02-03', NULL, 2),
(3, 12, '19', '14', '', 0, '', '', 0, 0, 0, 0, 0, 0, '', '0000-00-00', NULL, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbl_relacionar`
--

CREATE TABLE `tbl_relacionar` (
  `id_relacionar` int(11) NOT NULL,
  `id_classe_key` int(11) DEFAULT NULL,
  `id_disciplina_key` int(11) DEFAULT NULL,
  `ano_letivo` varchar(10) NOT NULL,
  `semestre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tbl_relacionar`
--

INSERT INTO `tbl_relacionar` (`id_relacionar`, `id_classe_key`, `id_disciplina_key`, `ano_letivo`, `semestre`) VALUES
(1, 1, 1, '2025', '1ºSemestre'),
(2, 2, 5, '2025', '1ºSemestre'),
(3, 1, 8, '2025', '1ºSemestre'),
(4, 1, 6, '2025', '1ºSemestre'),
(5, 3, 8, '2025', '1ºSemestre'),
(6, 1, 1, '2025', '1ºSemestre'),
(7, 1, 6, '2025', '1ºSemestre'),
(8, 4, 4, '2024', '1ºSemestre');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbl_relaturmaprof`
--

CREATE TABLE `tbl_relaturmaprof` (
  `id_rela_turma_prof` int(11) NOT NULL,
  `id_relacionar_key` int(11) DEFAULT NULL,
  `id_professor_key` int(11) DEFAULT NULL,
  `id_turma_key` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tbl_relaturmaprof`
--

INSERT INTO `tbl_relaturmaprof` (`id_rela_turma_prof`, `id_relacionar_key`, `id_professor_key`, `id_turma_key`) VALUES
(8, 7, 1, 25),
(9, 8, 17, 21),
(10, 1, 1, 26),
(11, 2, 4, 26),
(12, 1, 4, 25);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_pagamento`
--

CREATE TABLE `tipo_pagamento` (
  `id_tipo_pagamento` int(11) NOT NULL,
  `pagamento_referente` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo_pagamento`
--

INSERT INTO `tipo_pagamento` (`id_tipo_pagamento`, `pagamento_referente`) VALUES
(1, 'Matricula'),
(3, 'Propina JAN'),
(4, 'Propina FEV');

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma`
--

CREATE TABLE `turma` (
  `id_turma` int(11) NOT NULL,
  `nome_turma` varchar(15) NOT NULL,
  `ano_letivo` varchar(15) NOT NULL,
  `turno` varchar(30) NOT NULL,
  `duracao_turma` varchar(15) NOT NULL,
  `classe_turma` int(11) NOT NULL,
  `formato_turma` varchar(50) NOT NULL,
  `numero_sessoes_formato` tinyint(2) NOT NULL,
  `data_criado_turma` date DEFAULT NULL,
  `data_modificado_turma` date DEFAULT NULL,
  `criado_por` int(11) DEFAULT NULL,
  `modificado_por` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `turma`
--

INSERT INTO `turma` (`id_turma`, `nome_turma`, `ano_letivo`, `turno`, `duracao_turma`, `classe_turma`, `formato_turma`, `numero_sessoes_formato`, `data_criado_turma`, `data_modificado_turma`, `criado_por`, `modificado_por`) VALUES
(7, 'MB', '', '', '1', 11, 'Trimestral', 3, NULL, NULL, 2, NULL),
(13, 'MA', '', '', '1', 4, 'Trimestral', 3, NULL, NULL, 2, NULL),
(14, 'MB', '', '', '1', 11, 'Trimestral', 3, NULL, NULL, 2, NULL),
(21, 'MB', '2024/2025', 'Manha', '1', 10, 'Trimestral', 3, NULL, NULL, 2, NULL),
(22, 'MB', '2024/2025', 'Manha', '1', 5, 'Trimestral', 3, NULL, NULL, 2, NULL),
(23, 'MB', '2024/2025', 'Manha', '1', 5, 'Trimestral', 3, NULL, NULL, 2, NULL),
(24, 'MA', '2024/2025', 'Tarde', '1', 11, 'Trimestral', 3, NULL, NULL, 2, NULL),
(25, 'MA', '2024/2025', 'ManhÃ', '1', 1, 'Trimestral', 3, NULL, NULL, 2, NULL),
(26, 'TA', '2024/2025', 'Tarde', '1', 1, 'Trimestral', 3, NULL, NULL, 2, NULL),
(27, 'NA', '2024/2025', 'NOITE', '1', 1, 'Trimestral', 3, NULL, NULL, 2, NULL),
(28, 'MA', '2024/2025', 'Manha', '1', 2, 'Trimestral', 3, NULL, NULL, 2, NULL),
(29, 'A', '2024/2025', 'Manha', '1', 3, 'Trimestral', 3, NULL, NULL, 77, NULL),
(30, 'A', '2024/2025', 'Manha', '1', 14, 'Trimestral', 3, NULL, NULL, 77, NULL),
(31, 'A', '2024/2025', 'Tarde', '1', 12, 'Trimestral', 3, NULL, NULL, 77, NULL),
(32, 'F', '2024/2025', 'Tarde', '1', 4, 'Trimestral', 3, NULL, NULL, 77, NULL),
(33, 'NA', '2025/2026', 'NOITE', '1', 2, 'Trimestral', 3, NULL, NULL, 77, NULL),
(34, '11ªA', '2025/2026', 'Manha', '1', 3, 'Trimestral', 3, NULL, NULL, 77, NULL),
(35, '7ªA', '2024/2025', 'Manha', '1', 9, 'Trimestral', 3, NULL, NULL, 77, NULL),
(36, '1ªB', '2024/2025', 'Tarde', '1', 10, 'Trimestral', 3, NULL, NULL, 77, NULL),
(37, 'MB', '2022/2023', 'Manha', '1', 10, 'Trimestral', 3, NULL, NULL, 77, NULL),
(38, 'MB', '2025/2026', 'NOITE', '1', 1, 'Trimestral', 3, NULL, NULL, 77, NULL),
(39, 'IT', '2025/2026', 'Noite', '1', 2, 'Trimestral', 3, NULL, NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_user` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `senha` text NOT NULL,
  `fich_criacao` datetime DEFAULT NULL,
  `fich_atualizacao` datetime DEFAULT NULL,
  `nivel_acesso` varchar(11) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_user`, `nome`, `categoria_id`, `email`, `categoria`, `senha`, `fich_criacao`, `fich_atualizacao`, `nivel_acesso`, `status`) VALUES
(1, 'Mario Silva', 1, 'mario@gmail.com', '', '$2y$10$P65Q5WJ9aBWkCf5iCJj7W.0lV3jPV/wmy7maxyQwttDy5kQ3.lVA.', '2024-12-11 00:00:00', '0000-00-00 00:00:00', '1', 'Activo'),
(2, 'SUPORTE 1', 1, 'suporte@gmail.com', '', '$2y$10$oo0R4nLw8woiZ3MMuJaYAOseVCBgwKGahPTLiG5tDQt20HWHLyf/6', '2024-12-11 00:00:00', '0000-00-00 00:00:00', '1', 'Activo'),
(54, 'Fray', 3, 'fray@gmail.com', 'DA', '$2y$10$/L3Znzhy941hJzSap9TkteL7Us2IIn3h//PxBIlOCp5iva21EFsyG', '2024-11-20 10:21:33', '2024-11-20 10:21:33', '1', 'Activo'),
(56, 'Gonçalves Antonio', 1, 'goncalo@gmail.com', 'Administrador', '$2y$10$Mrob7cayt9c6sUgJq3WW6.rg16U3JqSHCKfwsYLrdrLluW5YPGLGq', '2024-11-20 10:33:52', '2024-11-20 10:33:52', '1', 'Activo'),
(57, 'Aderito Zimbo', 5, 'aderitozimbo@gmail.com', 'Contabilidade', '$2y$10$U1nZwIJQz9u58MdEgrMdHO38bkhytglsmEBQw6mCRaFdR7Jbqz/.a', '2024-11-21 10:13:10', '2024-11-21 10:13:10', '1', 'Activo'),
(77, 'Maria', 30, 'maria@gmail.com', '', '$2y$10$FYvSFue8kW8qvJftvhbLHOEjYf1UWM0YRN0nJTTKdoH9Bl.QS5tz2', '2024-11-29 08:48:12', NULL, '1', 'Activo'),
(78, 'Ibony Simão', 31, 'ibony@gmail.com', '', '$2y$10$crvFor95jElR2nOLT4BLEOjA8r4c7XILImOeU/gLsOnltwEv7KLoO', '2024-11-29 10:09:55', NULL, '5', 'Activo'),
(79, 'Fernando Monteiro', 26, 'fernando@gmail.com', '', '$2y$10$m/r5iLfrsDstJf3KovdB1O1sMvQtj/fFue.9lzFtccRhVYxJ2OG7a', '2024-11-29 11:05:06', NULL, '1', 'Activo'),
(80, 'Soto ', 29, 'soto@gmail.com', '', '$2y$10$RBg4cR5r.K8p15mH/4YqQ.lMa59.gfrBc0v0gDfLMKjP6XTAPkNVW', '2024-12-01 09:37:19', NULL, '1', 'Activo'),
(88, 'Isabel eduardo', 26, 'isabel@gmail.com', '', '$2y$10$2DstwhNo6moT0sbx5mUNaek7.nUSvcKjOHmuLeaw1.2WJlKzN62sW', '2024-12-01 15:35:57', NULL, '1', 'Activo'),
(90, 'Joao Silva', 2, 'joao.silva@email.com', 'Aluno', 'ccae7d5f32fb9181db10747a2878a74d2520408080f55419c12a3b80e7c41516', '2024-12-04 19:54:08', NULL, 'Aluno', 'Activo'),
(91, 'Yomandy da Fonte', 26, 'yomandy@gmail.com', '', '$2y$10$XyFsnHYLFNY/7m4lsxMVEeygV66XgBLqTpVQMF8ePFCXMitsN40xa', '2024-12-13 10:51:55', NULL, '1', 'Activo'),
(92, 'Zaqueu Neto', 26, 'zaqueu@gmail.com', '', '$2y$10$WWOh4s1S73d6R5muBrebU.bjFDuLcGdn9Bu.eqFxw63qYYw3q5PZG', '2024-12-17 16:23:30', NULL, '1', 'Activo'),
(93, 'Aristoteles', 31, 'ary@gmail.com', '', '$2y$10$4eRZZ7OuA2/PvPdRibmHGevwEm4Je1g80vF9vDDMKxkesEzaz//xC', '2024-12-19 11:39:42', '2024-12-19 11:39:42', NULL, 'Activo'),
(96, 'Mary Lopez', 31, 'mary.lopez@gmail.com', '', '$2y$10$xc7KmhSi5VjYgifm3vwiQeqsZlb8mgjqL2NCQReCTHnpMK9viFb/q', '2024-12-19 11:55:19', '2024-12-19 11:55:19', '5', 'Activo'),
(97, 'Helder', 31, 'helder@gmail.com', '', '$2y$10$9CwujAp3jyHWwFJm.HOcke..P6SmXuCnz/7Af4M6J8cQZYBfBvkWi', '2024-12-20 21:41:46', '2024-12-20 21:41:46', '5', 'Activo'),
(98, 'Margarida', 31, 'margarida@gmail.com', '', '$2y$10$ICzjrsc8lhwV.73BltF0m.SvDscYfujgENX3M1YkdGBziZV5Ej7yG', '2024-12-20 22:02:19', '2024-12-20 22:02:19', '5', 'Activo'),
(105, 'Fuaxa', 31, 'fuaxa.fuaxa@gmail.com', '', '$2y$10$mbu4dYA7Kh5InUoCBkqZh./xxyJZy6gPP7cfAD6.XYy.jKTdkCFdy', '2024-12-22 15:34:14', '2024-12-22 15:34:14', '5', 'Activo'),
(106, 'Edmuene', 31, 'edmuene@gmail.com', '', '$2y$10$/4zRkostdV/hrx5aahLoO.A9kYDsU33kgblndjG8zmnoQejGGkaAu', '2024-12-22 15:36:07', '2024-12-22 15:36:07', '5', 'Activo'),
(111, 'GGA', 1, 'GGA@gmail.com', '', '$2y$10$7iR1G.p6C1Ui3g0D8UU3y.ynbouaHeVFdTNv2xhzXqKVbKn1XujF.', '2025-01-24 15:03:22', NULL, '1', 'Activo'),
(113, 'Bartolomeu Dias', 26, 'dias@gmail.com', 'ALUNO', '$2y$10$FvJoUqbborEvjz33YsoIluYZXPX5SKM/gDEmByFtOwwXm7/R8VS4S', '2025-01-24 15:17:24', NULL, '1', 'Activo'),
(114, 'joana', 5, 'joana@gmail.com', 'Contabilidade', '$2y$10$f42WkkvnFE/.7fva5t8ZfOG77z4c6CHHHl/ooPVEgfy2ht0w81YSC', '2025-01-24 15:19:21', NULL, '1', 'Activo'),
(115, 'Matondo', 31, 'matondo@gmail.com', 'PROFESSOR', '$2y$10$bf6QLjDMe0PVnwnosm74IOeN5lEiOlDIppVch8yRRqh4AWt7K629u', '2025-01-24 15:23:15', NULL, '1', 'Activo'),
(116, 'Ramos', 31, 'ramos@gmail.com', 'PROFESSOR', '$2y$10$IMnUZ/1ZOqwOjY.kTzO/4O0DdmVDZ9zASQ1xQij9RFxh0W9OPUKEy', '2025-01-24 15:30:57', NULL, NULL, 'Activo'),
(117, 'katia', 26, 'katia@gmail.com', 'ALUNO', '$2y$10$HRJJ4l4nNY1uU2/mGwVwu.z1Gn6WT8UfD4PnYme5RCA4Kf9jyY2pq', '2025-01-24 15:40:56', NULL, '1', 'Activo'),
(118, 'Lourenço', 26, 'lourenco@gmail.com', 'ALUNO', '$2y$10$xVaL9p4vjg4eX96lQhnJ6.c3PCj/oRWM1LVirBZNxmxWOEUuiL57W', '2025-01-24 16:14:09', NULL, '1', 'Activo'),
(119, 'Garcia Eduardo', 26, 'garciatd@gmail.com', 'ALUNO', '$2y$10$9vqAgrnP8F7lUGX9wm5Y/ObIYoXXL/891jEGnJnytoUXsWscH.cu.', '2025-01-27 21:46:52', NULL, '1', 'Activo'),
(120, 'Mario de Lemos', 31, 'mariolemos@gmail.com', '', '$2y$10$SR6zUp4LqeOm1wsl71fSe.eZPXnESPRd5/o6areg4HeItr73XE.iK', '2025-01-28 08:45:06', '2025-01-28 08:45:06', '5', 'Activo'),
(123, 'Queiroz', 31, 'qz@gmail.com', '', '$2y$10$/Ln8h9SgxBjwRE5QommRLOUKL2ZmHqGhUYoRNkcYV8EJN8YlOKjNa', '2025-02-04 08:05:06', '2025-02-04 08:05:06', '5', 'Activo'),
(124, 'Marlene', 26, 'marlene@gmail.com', 'ALUNO', '$2y$10$6MTI9mrlXCov97IZNU6nf.2FxF0QgxJnzuGDTe1af12P5ykR9o7.K', '2025-02-18 14:39:22', NULL, '1', 'Activo'),
(125, 'Anna Maria', 26, 'anna@gmail.com', 'ALUNO', '$2y$10$BSrrvpfiqzW/rjFvwuLHvObZV46ZlpDnEBJAbxeGX5M7f/P4gy7b2', '2025-02-18 14:39:54', NULL, '1', 'Activo'),
(126, 'Helder Mualunga', 31, 'h.mualunga@gmail.com', '', '$2y$10$ymLuDh8DidfdfNy6E.CHkOuPTS7UElZxHY.ns3VkcWWXNcCGPuuR.', '2025-02-18 14:51:31', '2025-02-18 14:51:31', '5', 'Activo'),
(127, 'Jose', 31, 'jose@gmail.com', '', '$2y$10$aLRbIxBZjNg/xz2nNCp7D..wxVbdmZBb2T64qF0z.RgWLtsAXMm9O', '2025-02-18 15:10:38', '2025-02-18 15:10:38', '5', 'Activo'),
(128, 'Simão Garcia', 31, 'simao@gmail.com', '', '$2y$10$AmqqFaIjuk9/pToPo1NLPuOfD/CzXA0fOaIEDDavk9Mx/T9Ki0Tcy', '2025-02-22 15:45:45', '2025-02-22 15:45:45', '5', 'Activo'),
(129, 'Maria Kiala', 26, 'mariakiala@gmail.com', '', '$2y$10$f3CKjyQyAD9BlGa9TlMVfOE1.Rdigk63v17JqYMUauFyxkysUOi0.', '2025-03-12 20:00:50', '2025-03-12 20:00:50', '3', 'Activo'),
(130, 'ffafafafa', 26, 'dafa180086@gmail.com', '', '$2y$10$FhRPmkmLLo/C11m6zAAPjuCJPv5AeLnfrcxSEXaRC6HAWEYj331Qe', '2025-03-12 20:11:39', '2025-03-12 20:11:39', '3', 'Activo'),
(131, 'Anastacio', 26, 'anastaciog@gmail.com', '', '$2y$10$giZjoHXTGL6iuF7cQAnSc.uhJTH1YyG9Y3Yai51sd5F8SqXYhUZ3G', '2025-03-12 20:16:09', '2025-03-12 20:16:09', '3', 'Activo'),
(133, 'Janeth', 26, 'jane123@gmail.com', '', '$2y$10$qtQPE2AqX7Y0CqhEZdZX.uJyqwD.9tUHhHHQ95lo7HHbuFXeldWKO', '2025-03-19 18:59:51', '2025-03-19 18:59:51', '3', 'Activo'),
(134, 'Janeth', 26, 'jane222@gmail.com', 'ALUNO', '$2y$10$tfQBkHIs1h2u9wuOkdkZQOKUTyH2u1DjoKnTaeKmZy9oNOvV14yN2', '2025-03-19 19:26:07', '2025-03-19 19:26:07', '3', 'Activo'),
(136, 'Janeth', 26, 'jane098@gmail.com', 'ALUNO', '$2y$10$BSjwkj9xgNCRPFF/GOdeEu76xRZzTANWK8x8/eKn.r5qbDhqwBEke', '2025-03-19 19:53:09', '2025-03-19 19:53:09', '3', 'Activo'),
(143, 'Janeth', 26, 'jane111@gmail.com', 'ALUNO', '$2y$10$Jiuo5UozS8f.yqRXKWE9eOY8u2ybj/kHZ/e1LCCpS0w6fjuzughBe', '2025-03-19 20:14:18', '2025-03-19 20:14:18', '3', 'Activo'),
(145, 'SSSSS', 1, 'SS@GMAIL.COM', 'ADMINISTRADOR', '$2y$10$voDFyCeWqHjxtuEdIn7Bb.UeS2XX1fy/lr6kxDwyLM3/yHG1zgmEe', '2025-03-24 12:20:42', NULL, '1', 'Activo'),
(156, 'IGOR SANTANA', 26, 'iGOR@gmail.com', 'ALUNO', '$2y$10$w4ZarsQIbjoFXFIhWOFQIO8PjDdVRaNrPh1o2xhhuAqk0E1qEoxjC', '2025-03-28 09:53:19', '2025-03-28 09:53:19', '3', 'Activo'),
(180, 'ANA UMBA', 26, 'umba@gmail.com', 'ALUNO', '$2y$10$i9zzZtqwruDElem4WXPk1u/kMHuCHoroV.vVl6SR8.QkDM/SY74ma', '2025-04-01 14:20:15', '2025-04-01 14:20:15', '3', 'Activo'),
(188, 'rwrwr', 26, 'Artur@gmail.com', 'ALUNO', '$2y$10$26Sx5z8xKDBpBuIr88Sqy.VInd894OTYumMNhtLR2nYqSODXII//y', '2025-04-05 06:54:46', '2025-04-05 06:54:46', '3', 'Activo'),
(197, 'Paulina', 26, 'paulina@gmail.com', 'ALUNO', '$2y$10$PUL0W1Qdo333zVOQOelxD.uTYe0EewtVSXXxO1pa6szA7I31jOhei', '2025-04-05 12:17:44', '2025-04-05 12:17:44', '3', 'Activo'),
(198, 'Bartolomeu', 26, 'bartolomeu@gmail.com', 'ALUNO', '$2y$10$swa/Hr2Diu8ZcKwKhF1QDeSvyc0/.ZJrLcd0qK1vnYbmg8akFurU2', '2025-04-05 14:33:27', '2025-04-05 14:33:27', '3', 'Activo'),
(199, 'Jose Martins', 31, 'josemarins@gmail.com', '', '$2y$10$Gl9GhI09lonUMnnpkTPOu.LwFa1P8nmckHQ8J48aDvkwlkuIgo5jS', '2025-06-11 14:14:55', '2025-06-11 14:14:55', '5', 'Activo'),
(200, 'Wague', 26, 'w@gmail.com', 'ALUNO', '$2y$10$Gki3Cjufa6ZtLTykCby8Pe0Z9tkVCqqkxJahK8TzLTZX3ki97Wqby', '2025-06-12 08:32:35', '2025-06-12 08:32:35', '3', 'Activo'),
(201, 'Bangs', 31, 'bang@gmail.com', '', '$2y$10$ZD5Tkfk87DxSG25YlCEDRun85tPCVZ8hc1lfDAWbn0weijrYk0Hue', '2025-09-19 11:00:05', '2025-09-19 11:00:05', '5', 'Activo'),
(202, 'Santos', 31, 'silas@gmail.com', '', '$2y$10$1Wl4.A30zpxqck3l0ljrg.vdeIKFwdM04UzmbG1ZMCPMgTeZXqbMW', '2025-09-19 11:11:28', '2025-09-19 11:11:28', '5', 'Activo'),
(203, 'Brent', 31, 'brent@gmail.com', 'PROFESSOR', '$2y$10$J4b3WP/qClA/Sj48o4SsJuIU0ES2UrOkHR4shPUTznVRa.NXeeRLu', '2025-09-22 11:24:42', NULL, '1', 'Activo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `valores_por_classe`
--

CREATE TABLE `valores_por_classe` (
  `id_valor_classe` int(11) NOT NULL,
  `id_classe_key` int(11) NOT NULL,
  `taixa_matricula` varchar(30) NOT NULL,
  `taixa_mensal` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `valores_por_classe`
--

INSERT INTO `valores_por_classe` (`id_valor_classe`, `id_classe_key`, `taixa_matricula`, `taixa_mensal`) VALUES
(2, 3, '7500', '25000'),
(3, 10, '2000', '6500'),
(4, 11, '4000', '8000'),
(5, 2, '8500', '28500'),
(6, 1, '9000', '30000'),
(7, 7, '5200', '10000'),
(8, 6, '1200', '24000'),
(9, 1, '9000KZ', '30000KZ'),
(12, 5, '3500', '8000');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nome_categoria` (`nome_categoria`);

--
-- Índices de tabela `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id_classe`);

--
-- Índices de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`id_disciplina`);

--
-- Índices de tabela `inscricao`
--
ALTER TABLE `inscricao`
  ADD PRIMARY KEY (`id_inscricacao`),
  ADD KEY `fk_inscricao_classe` (`classeCandidato`);

--
-- Índices de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `id_aluno_key` (`id_aluno_key`),
  ADD KEY `pagamento_referente` (`pagamento_referente`);

--
-- Índices de tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_id_user_key` (`id_user_key`);

--
-- Índices de tabela `tbl_aluno`
--
ALTER TABLE `tbl_aluno`
  ADD PRIMARY KEY (`id_aluno`),
  ADD UNIQUE KEY `unique_numero_processo` (`numero_processo`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `fk_aluno_user` (`id_user_key`);

--
-- Índices de tabela `tbl_alunos_turmas`
--
ALTER TABLE `tbl_alunos_turmas`
  ADD PRIMARY KEY (`id_aluno_turma`),
  ADD KEY `id_turma_keys` (`id_turma_keys`),
  ADD KEY `id_aluno_keys` (`id_aluno_keys`);

--
-- Índices de tabela `tbl_horarios`
--
ALTER TABLE `tbl_horarios`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `id_rela_turma_prof_key` (`id_rela_turma_prof_key`);

--
-- Índices de tabela `tbl_notas`
--
ALTER TABLE `tbl_notas`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `id_rela_turma_prof_key` (`id_rela_turma_prof_key`),
  ADD KEY `id_aluno_key` (`id_aluno_key`);

--
-- Índices de tabela `tbl_relacionar`
--
ALTER TABLE `tbl_relacionar`
  ADD PRIMARY KEY (`id_relacionar`),
  ADD KEY `id_classe_key` (`id_classe_key`),
  ADD KEY `id_disciplina_key` (`id_disciplina_key`);

--
-- Índices de tabela `tbl_relaturmaprof`
--
ALTER TABLE `tbl_relaturmaprof`
  ADD PRIMARY KEY (`id_rela_turma_prof`),
  ADD KEY `id_relacionar_key` (`id_relacionar_key`),
  ADD KEY `id_professor_key` (`id_professor_key`),
  ADD KEY `id_turma_key` (`id_turma_key`);

--
-- Índices de tabela `tipo_pagamento`
--
ALTER TABLE `tipo_pagamento`
  ADD PRIMARY KEY (`id_tipo_pagamento`);

--
-- Índices de tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`id_turma`),
  ADD KEY `classe_turma` (`classe_turma`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Índices de tabela `valores_por_classe`
--
ALTER TABLE `valores_por_classe`
  ADD PRIMARY KEY (`id_valor_classe`),
  ADD KEY `id_classe_key` (`id_classe_key`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `classe`
--
ALTER TABLE `classe`
  MODIFY `id_classe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `id_disciplina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `inscricao`
--
ALTER TABLE `inscricao`
  MODIFY `id_inscricacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `tbl_aluno`
--
ALTER TABLE `tbl_aluno`
  MODIFY `id_aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de tabela `tbl_alunos_turmas`
--
ALTER TABLE `tbl_alunos_turmas`
  MODIFY `id_aluno_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `tbl_horarios`
--
ALTER TABLE `tbl_horarios`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbl_notas`
--
ALTER TABLE `tbl_notas`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tbl_relacionar`
--
ALTER TABLE `tbl_relacionar`
  MODIFY `id_relacionar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `tbl_relaturmaprof`
--
ALTER TABLE `tbl_relaturmaprof`
  MODIFY `id_rela_turma_prof` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `tipo_pagamento`
--
ALTER TABLE `tipo_pagamento`
  MODIFY `id_tipo_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `id_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT de tabela `valores_por_classe`
--
ALTER TABLE `valores_por_classe`
  MODIFY `id_valor_classe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `inscricao`
--
ALTER TABLE `inscricao`
  ADD CONSTRAINT `fk_inscricao_classe` FOREIGN KEY (`classeCandidato`) REFERENCES `classe` (`id_classe`);

--
-- Restrições para tabelas `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`id_aluno_key`) REFERENCES `tbl_aluno` (`id_aluno`),
  ADD CONSTRAINT `pagamentos_ibfk_2` FOREIGN KEY (`pagamento_referente`) REFERENCES `tipo_pagamento` (`id_tipo_pagamento`);

--
-- Restrições para tabelas `tbl_aluno`
--
ALTER TABLE `tbl_aluno`
  ADD CONSTRAINT `fk_aluno_user` FOREIGN KEY (`id_user_key`) REFERENCES `usuarios` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tbl_alunos_turmas`
--
ALTER TABLE `tbl_alunos_turmas`
  ADD CONSTRAINT `tbl_alunos_turmas_ibfk_2` FOREIGN KEY (`id_turma_keys`) REFERENCES `turma` (`id_turma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_alunos_turmas_ibfk_3` FOREIGN KEY (`id_aluno_keys`) REFERENCES `tbl_aluno` (`id_aluno`);

--
-- Restrições para tabelas `tbl_horarios`
--
ALTER TABLE `tbl_horarios`
  ADD CONSTRAINT `tbl_horarios_ibfk_1` FOREIGN KEY (`id_rela_turma_prof_key`) REFERENCES `tbl_relaturmaprof` (`id_rela_turma_prof`);

--
-- Restrições para tabelas `tbl_notas`
--
ALTER TABLE `tbl_notas`
  ADD CONSTRAINT `fk_rela_turma_prof` FOREIGN KEY (`id_rela_turma_prof_key`) REFERENCES `tbl_relaturmaprof` (`id_rela_turma_prof`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_notas_ibfk_1` FOREIGN KEY (`id_aluno_key`) REFERENCES `tbl_aluno` (`id_aluno`);

--
-- Restrições para tabelas `tbl_relacionar`
--
ALTER TABLE `tbl_relacionar`
  ADD CONSTRAINT `tbl_relacionar_ibfk_1` FOREIGN KEY (`id_classe_key`) REFERENCES `classe` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_relacionar_ibfk_2` FOREIGN KEY (`id_disciplina_key`) REFERENCES `disciplinas` (`id_disciplina`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tbl_relaturmaprof`
--
ALTER TABLE `tbl_relaturmaprof`
  ADD CONSTRAINT `tbl_relaturmaprof_ibfk_1` FOREIGN KEY (`id_relacionar_key`) REFERENCES `tbl_relacionar` (`id_relacionar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_relaturmaprof_ibfk_2` FOREIGN KEY (`id_professor_key`) REFERENCES `professor` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_relaturmaprof_ibfk_3` FOREIGN KEY (`id_turma_key`) REFERENCES `turma` (`id_turma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `fk_turma` FOREIGN KEY (`classe_turma`) REFERENCES `classe` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`classe_turma`) REFERENCES `classe` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `valores_por_classe`
--
ALTER TABLE `valores_por_classe`
  ADD CONSTRAINT `valores_por_classe_ibfk_1` FOREIGN KEY (`id_classe_key`) REFERENCES `classe` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
