DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.planos(
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_plano VARCHAR(50) NOT NULL,
  valor_plano DECIMAL(3,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios(
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  plano_id INT,
  usuario_nome VARCHAR(50) NOT NULL,
  usuario_idade INT NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas(
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  artista_nome VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas_seguidos(
  usuario_id INT,
  artista_id INT,
  CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.albums(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  artista_id INT,
  album_nome VARCHAR(50) NOT NULL,
  ano_lancamento YEAR NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes(
  cancao_id INT PRIMARY KEY AUTO_INCREMENT,
  album_id INT,
  cancao_nome VARCHAR(50) NOT NULL,
  duracao_segundos INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albums(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico_de_reproducoes(
  cancao_id INT,
  usuario_id INT,
  data_reproducao DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY(cancao_id, usuario_id),
  FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (nome_plano, valor_plano)
VALUES
  ('gratuito',	'0.00'),
  ('universitário',	'5.99'),
  ('pessoal',	'6.99'),
  ('familiar',	'7.99');

INSERT INTO SpotifyClone.usuarios (plano_id, usuario_nome, usuario_idade)
VALUES
  ('1', 'Thati', '23'),
  ('4', 'Cintia',	'35'),
  ('2', 'Bill',	'20'),
  ('3', 'Roger',	'45'),
  ('3', 'Norman',	'58'),
  ('4', 'Patrick',	'33'),
  ('2', 'Vivian',	'26'),
  ('2', 'Carol',	'19'),
  ('4', 'Angelina',	'42'),
  ('4', 'Paul',	'46');

INSERT INTO SpotifyClone.artistas (artista_nome)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');

INSERT INTO SpotifyClone.artistas_seguidos (usuario_id, artista_id)
VALUES
  ('1', '1'),
  ('1', '4'),
  ('1', '3'),
  ('2', '1'),
  ('2', '3'),
  ('3', '2'),
  ('3', '1'),
  ('4', '4'),
  ('5', '5'),
  ('5', '6'),
  ('6', '6'),
  ('6', '3'),
  ('6', '1'),
  ('7', '2'),
  ('7', '5'),
  ('8', '1'),
  ('8', '5'),
  ('9', '6'),
  ('9', '4'),
  ('9', '3'),
  ('10', '2'),
  ('10', '6');

INSERT INTO SpotifyClone.albums (artista_id, album_nome, ano_lancamento)
VALUES
('1', 'Envious',	'1990'),
('1', 'Exuberant',	'1993'),
('2',	'Hallowed Steam',	'1995'),
('3',	'Incandescent',	'1998'),
('4', 'Temporary Culture',	'2001'),
('4', 'Library of liberty',	'2003'),
('5',	'Chained Down',	'2007'),
('5',	'Cabinet of fools',	'2012'),
('5',	'No guarantees',	'2015'),
('6',	'Apparatus',	'2015');

INSERT INTO SpotifyClone.cancoes (album_id, cancao_nome, duracao_segundos)
VALUES
  ('1',	'Soul For Us', '200'),
  ('1',	'Reflections Of Magic', '163'),
  ('1',	'Dance With Her Own',	'116'),
  ('2',	'Troubles Of My Inner Fire', '203'),
  ('2',	'Time Fireworks', '152'),
  ('3',	'Magic Circus', '105'),
  ('3', 'Honey, So Do I', '207'),
  ('3', "Sweetie, Let's Go Wild", '139'),
  ('3', 'She Knows', '244'),
  ('4', 'Fantasy For Me', '100'),
  ('4', 'Celebration Of More', '146'),
  ('4', 'Rock His Everything', '223'),
  ('4', 'Home Forever', '231'),
  ('4', 'Diamond Power', '241'),
  ('4', "Let's Be Silly", '132'),
  ('5', 'Thang Of Thunder', '240'),
  ('5', 'Words Of Her Life', '185'),
  ('5', 'Without My Streets', '176'),
  ('6', 'Need Of The Evening', '190'),
  ('6', 'History Of My Roses', '222'),
  ('6', 'Without My Love', '111'),
  ('6', 'Walking And Game', '123'),
  ('6', 'Young And Father', '197'),
  ('7', 'Finding My Traditions', '179'),
  ('7', 'Walking And Man', '229'),
  ('7', 'Hard And Time', '135'),
  ('7', "Honey, I'm A Lone Wolf", '150'),
  ('8', "She Thinks I Won't Stay Tonight", '166'),
  ('8', "He Heard You're Bad For Me", '154'),
  ('8', "He Hopes We Can't Stay", '210'),
  ('8', 'I Know I Know', '117'),
  ('9', "He's Walking Away", '159'),
  ('9', "He's Trouble", '138'),
  ('9', 'I Heard I Want To Bo Alone', '120'),
  ('9', 'I Ride Alone', '151'),
  ('10', 'Honey', '79'),
  ('10', 'You Cheated On Me', '95'),
  ('10', "Wouldn't It Be Nice", '213'),
  ('10', 'Baby', '136'),
  ('10', 'You Make Me Feel So..', '83');

INSERT INTO SpotifyClone.historico_de_reproducoes (cancao_id, usuario_id, data_reproducao)
VALUES
  (36, 1, "2020-02-28 10:45:55"),
  (25, 1, "2020-05-02 05:30:35"),
  (23, 1, "2020-03-06 11:22:33"),
  (14, 1, "2020-08-05 08:05:17"),
  (15, 1, "2020-09-14 16:32:22"),
  (34, 2, "2020-01-02 07:40:33"),
  (24, 2, "2020-05-16 06:16:22"),
  (21, 2, "2020-10-09 12:27:48"),
  (39, 2, "2020-09-21 13:14:46"),
  (6, 3, "2020-11-13 16:55:13"),
  (3, 3, "2020-12-05 18:38:30"),
  (26, 3, "2020-07-30 10:00:00"),
  (2,  4, "2021-08-15 17:10:10"),
  (35, 4, "2021-07-10 15:20:30"),
  (27, 4, "2021-01-09 01:44:33"),
  (7, 5, "2020-07-03 19:33:28"),
  (12, 5, "2017-02-24 21:14:22"),
  (14, 5, "2020-08-06 15:23:43"),
  (1, 5, "2020-11-10 13:52:27"),
  (38, 6, "2019-02-07 20:33:48"),
  (29, 6, "2017-01-24 00:31:17"),
  (30, 6, "2017-10-12 12:35:20"),
  (22, 6, "2018-05-29 14:56:41"),
  (5, 7, "2018-05-09 22:30:49"),
  (4, 7, "2020-07-27 12:52:58"),
  (11, 7, "2018-01-16 18:40:43"),
  (39, 8, "2018-03-21 16:56:40"),
  (40, 8, "2020-10-18 13:38:05"),
  (32, 8, "2019-05-25 08:14:03"),
  (33, 8, "2021-08-15 21:37:09"),
  (16, 9, "2021-05-24 17:23:45"),
  (17, 9, "2018-12-07 22:48:52"),
  (8, 9, "2021-03-14 06:14:26"),
  (9, 9, "2020-04-01 03:36:00"),
  (20, 10, "2017-02-06 08:21:34"),
  (21, 10, "2017-12-04 05:33:43"),
  (12, 10, "2017-07-27 05:24:49"),
  (13, 10, "2017-12-25 01:03:57");
