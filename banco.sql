CREATE DATABASE banco;
USE banco;

CREATE TABLE cliente(
	id_cliente INT AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_cliente)
)CHARSET=utf8mb4;

ALTER TABLE cliente
ADD COLUMN cpf_cliente VARCHAR(14) NOT NULL UNIQUE;

INSERT INTO cliente VALUES
(NULL, "Cauê Rodrigo Nunes","459.505.324-06"),
(NULL, "Emanuelly Vanessa Nunes","521.691.154-55"),
(NULL, "Eduarda Daiane Assis","184.569.694-86"),
(NULL, "Vicente Sérgio Almada","507.498.284-71"),
(NULL, "Gael Arthur Noah Farias","555.216.934-40");

SELECT * FROM CLIENTE;

CREATE TABLE endereco(
	id_endereco INT AUTO_INCREMENT,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(5) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    id_cliente INT,
    PRIMARY KEY(id_endereco),
    FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente)
)CHARSET=utf8mb4;


INSERT INTO endereco VALUES
(NULL, "Rua Professor Rocha Melo", "892", "55819-370", "Bairro Novo", "Carpina", "PE", "1"),
(NULL, "Rua Lindolfo Viana", "593", "53040-210", "Rio Doce", "Olinda", "PE", "2"),
(NULL, "Rua Bela Vista", "276", "54320-334", "Jardim Jordão", "Jaboatão dos Guararapes", "PE", "3"),
(NULL, "Travessa Só nós Dois", "965", "52291-291", "Brejo da Guabiraba", "Recife", "PE", "4"),
(NULL, "Rua José de Souza Barbosa", "886", "55152-555", "COHAB-ll", "Belo Jardim", "PE", "5");

SELECT * FROM cliente
INNER JOIN endereco ON cliente.id_cliente = endereco.id_cliente;

CREATE TABLE pedido(
	id_pedido INT AUTO_INCREMENT,
    data_hora DATETIME NOT NULL,
    id_cliente INT,
    PRIMARY KEY(id_pedido),
    FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente)
)CHARSET=UTF8MB4;

INSERT INTO pedido VALUES
(NULL, "2026-08-23 12:34:45","1"),
(NULL, "2026-06-04 19:29:12", "2"),
(NULL, "2026-01-29 23:10:54", "3"),
(NULL, "2026-05-09 14:27:03", "4"),
(NULL, "2026-02-18 09:15:49", "5");

SELECT * FROM cliente
INNER JOIN pedido ON cliente.id_cliente = pedido.id_cliente;

CREATE TABLE produto (
	id_produto INT AUTO_INCREMENT,
    nome_produto VARCHAR(50) NOT NULL,
    codigo_produto VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    valor DECIMAL(5,2) NOT NULL,
    nome_loja VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_produto)
)CHARSET=utf8mb4;

INSERT INTO produto VALUES
(NULL, "TEC001", "TEC001", "34", "149.90", "Tech Store"),
(NULL, "Mouse Gamer", "MOU002", "21", "89.90", "Tech Store"),
(NULL, "Monitor 24 Polegadas", "MON003", "7", "799.90", "Info Center"),
(NULL, "Headset Gamer", "HEA004", "12", "129.90", "Game House"),
(NULL, "Webcam Full HD", "WEB005", "15", "199.90", "Tech Store");

SELECT * FROM produto;

CREATE TABLE pedido_produto(
	id_pedido_produto INT AUTO_INCREMENT,
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL,
	PRIMARY KEY(id_pedido_produto),
    FOREIGN KEY(id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY(id_produto) REFERENCES produto(id_produto)
)CHARSET=utf8mb4;

INSERT INTO pedido_produto VALUES
(NULL, "1", "1", "2"),
(NULL, "1", "2", "3"),
(NULL, "2", "2", "5"),
(NULL, "2", "5", "3"),
(NULL, "3", "3", "1"),
(NULL, "3", "2", "1"),
(NULL, "4", "4", "3"),
(NULL, "4", "3", "2"),
(NULL, "5", "5", "3"),
(NULL, "5", "1", "3");
UPDATE pedido
SET id_pedido = CASE
	WHEN id_pedido = 6 THEN 1
    WHEN id_pedido = 7 THEN 2
    WHEN id_pedido = 8 THEN 3
    WHEN id_pedido = 9 THEN 4
    WHEN id_pedido = 10 THEN 5
    END
WHERE id_pedido IN (6, 7, 8, 9, 10);

SELECT * FROM pedido_produto
INNER JOIN pedido 
	ON pedido.id_pedido = pedido_produto.id_pedido
INNER JOIN produto
	ON produto.id_produto = pedido_produto.id_pedido;