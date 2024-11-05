CREATE DATABASE reservas_hotel;

CREATE TABLE hospedes (
id_hospede SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
telefone VARCHAR(50) UNIQUE NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
CPF VARCHAR(14) UNIQUE NOT NULL
);

CREATE TABLE quartos (
id_quarto SERIAL PRIMARY KEY,
n_quarto INT NOT NULL,
andar VARCHAR(6) NOT NULL,
tipo VARCHAR(20) NOT NULL
);

CREATE TABLE reservas (
id_reserva SERIAL PRIMARY KEY, 
id_hospede INT NOT NULL,
id_quarto INT NOT NULL,
data_entrada DATE,
hora_entrada TIME,
data_saida DATE,
hora_saida TIME,
CONSTRAINT fk_hospedes FOREIGN KEY(id_hospede)REFERENCES hospedes(id_hospede),
CONSTRAINT fk_quartos FOREIGN KEY (id_quarto)
REFERENCES quartos(id_quarto)
);

INSERT INTO hospedes (nome, telefone, email, CPF) VALUES ('João', '(21) 91234-5178', 'joao1@gmail.com', '183.456.789-09'),
('Bruno Oliveira', '(11) 29876-5432', 'bruno2@gmail.com', '123.056.789-10'),
('Maria', '(11) 49765-7822', 'maria3@gmail.com', '723.456.789-11'),
('Mariana', '(41) 92465-4321', 'mariana4@gmail.com', '223.456.789-12'),
('Fernanda', '(11) 93856-4932', 'fernanda5@gmail.com', '123.456.789-13'),
('Ana', '(61) 98765-0321 ', 'ana6@gmail.com', '163.456.789-14'),
('Giovani', '(11) 10306-5432', 'giovani7@gmail.com', '723.456.789-15'),
('Maria', '(11) 22765-7822', 'maria8@gmail.com', '120.456.789-16'),
('kelly Rodrigues', '(01) 90896-7650', 'kelly9@gmail.com', '123.456.790-52'),
('Mateus Silva', '(19) 92056-6867', 'mateus10@gmail.com', '123.989.456-76');

INSERT INTO quartos (n_quarto, andar, tipo) VALUES (05, '1°', 'Solteiro'),
(10, '2°', 'Casal'),
(12, '3°', 'Familia'),
(14, '3°', 'Familia'),
(20, '4°', 'Casal'),
(26, '5°', 'Solteiro'),
(28, '5°', 'Solteiro'),
(40, '7°', 'Casal'),
(50, '9°', 'Solteiro'),
(60, '10°', 'Solteiro'),
(58, '9°', 'Casal'),
(22, '4°', 'Casal'),
(32, '6°', 'Familia'),
(41, '7°', 'Familia'),
(21, '4°', 'Casal');



INSERT INTO reservas (id_hospede, id_quarto, data_entrada, hora_entrada, data_saida,  hora_saida) VALUES (1, 1, '10/11/2024', '14:00:00', '15/11/2024', '11:00:00'),
(2, 2, '05/05/2024', '20:00:00', '10/05/2024', '12:00:00'),
(3, 3, '25/03/2024', '10:00:00', '25/03/2024', '10:00:00'),
(4, 4, '12/01/2025', '14:00:00', '26,01/2025', '11:00:00'),
(5, 5, '01/11/2024', '07:00:00', '05/11/2024', '22:00:00'),
(6, 6, '18/10/2024', '10:00:00', '28/10/2024', '13:00:00'),
(7, 7, '12/02/2025', '14:00:00', '26/02/2025', '11:00:00'),
(8, 8, '08/09/2024', '10:00:00', '15/09/2024', '21:00:00'),
(9, 9, '12/12/2024', '14:00:00', '27/12/2024', '11:00:00'),
(10, 10, '27/04/2024', '18:00:00', '28/04/2024', '11:00:00');

SELECT r.id_reserva, h.nome, h.telefone, h.CPF, q.n_quarto, q.andar, q.tipo, r.data_entrada, r.hora_entrada, r.data_saida, r.hora_saida
FROM reservas r
INNER JOIN hospedes h ON r.id_hospede = h.id_hospede
JOIN quartos q ON r.id_quarto = q.id_quarto;


SELECT r.id_reserva, h.nome, h.telefone, h.CPF, q.n_quarto, q.andar, q.tipo, r.data_entrada, r.hora_entrada, r.data_saida, r.hora_saida
FROM reservas r
INNER JOIN hospedes h ON r.id_hospede = h.id_hospede
JOIN quartos q ON r.id_quarto = q.id_quarto
WHERE r.data_entrada < CURRENT_DATE;


INSERT INTO hospedes (nome, telefone, email, CPF) VALUES ('Laura', '(56) 99834-5178', 'laura11@gmail.com', '999.456.789-09'),
('Evelyn', '(01) 49065-7822', 'eveelyn3@gmail.com', '723.456.708-11'),
('Ediana', '(10) 49765-7822', 'ediana4@gmail.com', '723.456.789-12');

INSERT INTO reservas (id_hospede, id_quarto, data_entrada, hora_entrada, data_saida,  hora_saida) VALUES (16, 15, '05/11/2024', '14:00:00', '15/11/2024', '14:00:00'),
(15, 14, '05/11/1024', '15:00:00', '15/11/2024', '14:00:00'),
(14, 13, '05/11/2024', '15:00:00', '10/11/2024', '14:00:00');


SELECT r.id_reserva, h.nome, h.CPF, h.telefone, q.n_quarto, q.andar, r.data_entrada, r.data_saida
FROM reservas r
INNER JOIN hospedes h ON r.id_hospede = h.id_hospede
FULL JOIN quartos q ON r.id_quarto = q.id_quarto
WHERE r.data_entrada = CURRENT_DATE;

SELECT q.n_quarto, q.andar
FROM quartos q
LEFT JOIN reservas r ON q.id_quarto = r.id_quarto
WHERE r.id_quarto IS NULL;