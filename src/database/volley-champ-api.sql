-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-Nov-2023 às 20:13
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `volley-champ-api`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `champs`
--

CREATE TABLE `champs` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `date` date NOT NULL,
  `info` mediumtext NOT NULL,
  `local` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `champs`
--

INSERT INTO `champs` (`id`, `id_user`, `name`, `date`, `info`, `local`) VALUES
(2, 4, 'champ da raissa', '2023-10-15', 'dada dadadada dadada da dadadada  ', 'IFSP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `subscribe`
--

CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL,
  `category` varchar(1) NOT NULL,
  `subscribe_champs` int(11) NOT NULL,
  `subscribe_user` int(11) NOT NULL,
  `subscribe_duo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `subscribe`
--

INSERT INTO `subscribe` (`id`, `category`, `subscribe_champs`, `subscribe_user`, `subscribe_duo`) VALUES
(1, '', 2, 2, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `photo` varchar(700) NOT NULL,
  `access` varchar(265) NOT NULL,
  `nickname` varchar(265) NOT NULL,
  `sex` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `pass`, `photo`, `access`, `nickname`, `sex`) VALUES
(2, 'Jonatas', 'jo@gmail.com', '123', 'https://avatars.githubusercontent.com/u/139708582?v=4', 'player', 'jojo', 'M'),
(3, 'kaue', 'kaue@gmail.com', '123', 'https://avatars.githubusercontent.com/u/139708582?v=4', 'player', 'kaka', 'M'),
(4, 'raissa', 'raissa@gmail.com', '123', 'https://i.pinimg.com/564x/1d/71/4f/1d714fe2ec1848e592a0993121298f6c.jpg', 'adm', 'raissa', 'F'),
(6, 'macaco', 'exemplo@email.com', '$2b$10$tEh28hq0cV3OQNaFmO/TBO7QqWjb/4NgPRwkEQrQjwLNFGtPu/8KG', 'link_para_a_foto.jpg', 'adm', 'apelido', 'M');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `champs`
--
ALTER TABLE `champs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `champ_users` (`id_user`);

--
-- Índices para tabela `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscribe_id_champ` (`subscribe_champs`),
  ADD KEY `subscribe_id_users` (`subscribe_user`),
  ADD KEY `subscribe_id_duo` (`subscribe_duo`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `champs`
--
ALTER TABLE `champs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `champs`
--
ALTER TABLE `champs`
  ADD CONSTRAINT `champ_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `subscribe`
--
ALTER TABLE `subscribe`
  ADD CONSTRAINT `subscribe_id_champ` FOREIGN KEY (`subscribe_champs`) REFERENCES `champs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subscribe_id_duo` FOREIGN KEY (`subscribe_duo`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subscribe_id_users` FOREIGN KEY (`subscribe_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
