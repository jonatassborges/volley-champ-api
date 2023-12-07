-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Dez-2023 às 21:07
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
(3, 14, 'torneio ifsp', '2023-12-20', 'usar roupa vermelha', 'ifsp caraguatatuba'),
(4, 15, 'torneio ifsp', '2023-12-20', 'usar roupa vermelha', 'ifsp caraguatatuba SP'),
(5, 16, 'torneio ifsp', '2023-12-28', 'usar roupa vermelha', 'ifsp caraguatatuba SP'),
(6, 17, 'torneio do Jonatas ', '2024-12-26', 'Chegar 20HRS', 'RDP SSB');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `token` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `sessions`
--

INSERT INTO `sessions` (`id`, `id_user`, `token`) VALUES
(10, 14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTQsIm5hbWUiOiJjYXJsb3MiLCJhY2Nlc3MiOiJhZG0iLCJpYXQiOjE3MDE3OTc4MjN9._EO8qH4McYoLcWXp46DIq5aj2B2m4zmFIPLtAIJcZ60'),
(11, 15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsIm5hbWUiOiJjYXJsb3MiLCJhY2Nlc3MiOiJhZG0iLCJpYXQiOjE3MDE3OTk1NzR9.hO_oNEMM77JTdxEKyEhY92G69XclQ-tNRE7jmvc20c0'),
(12, 15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsIm5hbWUiOiJjYXJsb3MiLCJhY2Nlc3MiOiJhZG0iLCJpYXQiOjE3MDE3OTk2Mzd9.8HQTR1R_AE-AIMJR1P08L6qK8HyWv6nXJ6I1exZ7Fk0'),
(13, 15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsIm5hbWUiOiJjYXJsb3MiLCJhY2Nlc3MiOiJwbGF5ZXIiLCJpYXQiOjE3MDE3OTk5MTR9.jSXvWND0MywsW9LLMXN1n5Qcu1W95BBQFrz-6kfNNKE'),
(14, 15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsIm5hbWUiOiJjYXJsb3MiLCJhY2Nlc3MiOiJhZG0iLCJpYXQiOjE3MDE4MDEwNDh9.Hyq1aFc2KD5xd8aMJ215zOwwyfZeBalHN8KMnAqOXAY'),
(17, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsIm5hbWUiOiJqb25hdGFzIiwiYWNjZXNzIjoiYWRtIiwiaWF0IjoxNzAxODAxODkxfQ.21Gyn5DTpjWoZ7S2pDPeBRfDB_wq01ZRw1zbkU4I3ng'),
(18, 19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTksIm5hbWUiOiJtaWd1ZWwiLCJhY2Nlc3MiOiJwbGF5ZXIiLCJpYXQiOjE3MDE5NzI1MDh9.gUvKjhfFwcgL_y7zv7eGQlkA4UeP7jcQuDnSRAgUfsI'),
(19, 19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTksIm5hbWUiOiJtaWd1ZWwiLCJhY2Nlc3MiOiJwbGF5ZXIiLCJpYXQiOjE3MDE5NzMwMjh9.-0PCHirRdEM-jTtDuubyK5vwRagFqMQgY_SGhloZUTI'),
(20, 21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsIm5hbWUiOiJqb3NpYXMiLCJhY2Nlc3MiOiJwbGF5ZXIiLCJpYXQiOjE3MDE5Nzk1MDl9.ogUm6uqjDYKqbDdBRM8qvv4UQfQuSDzXJ_oE5Hg2pEg');

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
(2, 'M', 6, 19, 18),
(3, 'M', 6, 21, 20);

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
(14, 'carlos soares', 'carloss@gmail.com', '$2b$10$iOVK6pgw7.8RDkpgwMUFouEBKe2fjaKBWlpRA9OXVmGnxQ48X1S12', 'jnfnfns', 'player', 'carloss', 'F'),
(15, 'carlos', 'kk@gmail.com', '$2b$10$4swYgJc6kNwKFSawVZOA.eQJVwhZu91LLY1mHt3M3t11ex9q9WEwK', 'jnfnfn', 'adm', 'carlos', 'M'),
(16, 'joao', 'joao@gmail.com', '$2b$10$aCOn7HOGs01Y3KnEi2nJMezJ6xDPgcFpkMq4upw2NlNSPKyK8jNum', 'jnfnfn', 'adm', 'joao', 'M'),
(17, 'jonatas', 'jonatas@gmail.com', '$2b$10$dVmmlwmV3V5EPiu5sTjoDe1cUBDbevWhaYv.tCAc1RI2FePwhCMAu', 'jnfnfn', 'adm', 'jos.ninoo', 'M'),
(18, 'kaue', 'kaue@gmail.com', '$2b$10$dnuTHDbIgumupka.svUsD.I90zSn4FwfNjyWVLnKoq0CSaj7kojrq', 'jnfnfn', 'player', 'kaue', 'M'),
(19, 'miguel', 'miguel@gmail.com', '$2b$10$F0NxSupvHsPxdpw2LFQqduFz9ifFgSAC4kXnM1kdwn8bK2Bpqzs1m', 'jnfnfn', 'player', 'miguel', 'M'),
(20, 'kenedy', 'kenedy@gmail.com', '$2b$10$uh8oClKIqcVygQuXH3TCkOAndIdUXVsdXbt2esAacZz.kjJ3WCDie', 'jnfnfn', 'player', 'kenedy', 'M'),
(21, 'josias', 'josias@gmail.com', '$2b$10$JVa.ZuxP3q8VpBV3Oivk..MhyFSss1dUEr2CLz/W5iAFqDpBStSRe', 'jnfnfn', 'player', 'josias', 'M');

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
-- Índices para tabela `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_token` (`token`) USING BTREE,
  ADD KEY `id_user_user_id` (`id_user`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `champs`
--
ALTER TABLE `champs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `champs`
--
ALTER TABLE `champs`
  ADD CONSTRAINT `champ_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `id_user_user_id` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
