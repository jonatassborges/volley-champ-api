Create database `volley-champ-api`
use `volley-champ-api`;

CREATE TABLE `champs` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `date` date NOT NULL,
  `info` mediumtext NOT NULL,
  `local` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `photo` varchar(700) NOT NULL,
  `access` varchar(265) NOT NULL,
  `nickname` varchar(265) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL,
  `subscribe_champs` int(11) NOT NULL,
  `subscribe_user` int(11) NOT NULL,
  `subscribe_duo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `champs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `champ_users` (`id_user`);

ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscribe_id_champ` (`subscribe_champs`),
  ADD KEY `subscribe_id_users` (`subscribe_user`),
  ADD KEY `subscribe_id_duo` (`subscribe_duo`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `champs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `champs`
  ADD CONSTRAINT `champ_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `subscribe`
  ADD CONSTRAINT `subscribe_id_champ` FOREIGN KEY (`subscribe_champs`) REFERENCES `champs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subscribe_id_duo` FOREIGN KEY (`subscribe_duo`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subscribe_id_users` FOREIGN KEY (`subscribe_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;



INSERT INTO `champs` (`id`, `id_user`, `name`, `date`, `info`, `local`) VALUES
(2, 4, 'champ da raissa', '2023-10-15', 'dada dadadada dadada da dadadada  ', 'IFSP');


INSERT INTO `subscribe` (`id`, `subscribe_champs`, `subscribe_user`, `subscribe_duo`) VALUES
(1, 2, 2, 3);


INSERT INTO `users` (`id`, `name`, `email`, `pass`, `photo`, `access`, `nickname`) VALUES
(2, 'Jonatas', 'jo@gmail.com', '123', 'https://avatars.githubusercontent.com/u/139708582?v=4', 'player', 'jojo'),
(3, 'kaue', 'kaue@gmail.com', '123', 'https://avatars.githubusercontent.com/u/139708582?v=4', 'player', 'kaka'),
(4, 'raissa', 'raissa@gmail.com', '123', 'https://i.pinimg.com/564x/1d/71/4f/1d714fe2ec1848e592a0993121298f6c.jpg', 'adm', 'raissa');
