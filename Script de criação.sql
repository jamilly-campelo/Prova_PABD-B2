DROP DATABASE IF EXISTS campeonato;

CREATE DATABASE campeonato;

USE campeonato;

CREATE TABLE times (
	id INT,
    nome VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE partidas (
	id INT,
    time1_id INT NOT NULL,
    time1_gols INT UNSIGNED NOT NULL,
    time2_id INT NOT NULL,
    time2_gols INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (time1_id) REFERENCES times (id),
    FOREIGN KEY (time2_id) REFERENCES times (id)
);

INSERT INTO times VALUES
(1, 'América', 'RN'),
(2, 'ABC', 'RN'),
(3, 'Globo', 'RN'),
(4, 'Santa Cruz', 'RN');

INSERT INTO partidas VALUES
(1, 1, 2, 2, 0),
(2, 3, 1, 4, 1),
(3, 1, 2, 4, 1),
(4, 2, 1, 3, 2),
(5, 1, 3, 3, 1),
(6, 2, 0, 4, 3);