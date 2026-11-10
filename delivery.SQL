Enter password: ************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 17
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> DROP DATABASE IF EXISTS db_delivery;
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE DATABASE db_delivery;
Query OK, 1 row affected (0.02 sec)

mysql> USE db_delivery;
Database changed
mysql> CREATE TABLE clientes (
    ->  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    -> nome VARCHAR(100) NOT NULL,
    -> email VARCHAR(100) UNIQUE,
    -> telefone VARCHAR(20),
    -> cidade VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE produtos (
    ->  id_produto INT AUTO_INCREMENT PRIMARY KEY,
    -> descricao VARCHAR(100) NOT NULL,
    ->  preco DECIMAL(10,2) NOT NULL,
    -> estoque INT NOT NULL
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE pedidos (
    -> id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    ->  id_cliente INT,
    -> id_produto INT,
    -> quantidade INT NOT NULL,
    -> data_pedido DATE,
    -> FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE SET NULL,
    -> FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) ON DELETE SET NULL
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE entregas (
    ->  id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    ->  id_pedido INT NOT NULL,
    -> entregador VARCHAR(100) NOT NULL,
    -> endereco_entrega VARCHAR(200) NOT NULL,
    -> status_entrega ENUM('Pendente', 'Em rota', 'Entregue', 'Cancelada') DEFAULT 'Pendente',
    -> valor_frete DECIMAL(6,2) DEFAULT 5.00,
    -> data_saida DATETIME,
    -> data_entrega DATETIME,
    -> FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO clientes (nome, email, telefone, cidade) VALUES
    -> ('Ana Silva', 'ana@delivery.com', '11999990001', 'São Paulo'),
    -> ('Bruno Santos', 'bruno@delivery.com', '11999990002', 'Campinas'),
    -> ('Carlos Lima', 'carlos@delivery.com', '21999990003', 'João Pessoa'),
    -> ('Daniela Souza', 'daniela@delivery.com', '31999990004', 'Belo Horizonte'),
    -> ('Eduardo Costa', 'eduardo@delivery.com', '41999990005', 'Curitiba'),
    -> ('Fernanda Dias', 'fernanda@delivery.com', '51999990006', 'Porto Alegre'),
    -> ('Gabriel Alves', 'gabriel@delivery.com', '61999990007', 'Brasília'),
    -> ('Heloísa Rocha', 'heloisa@delivery.com', '71999990008', 'Salvador'),
    -> ('Igor Mendes', 'igor@delivery.com', '81999990009', 'Recife'),
    -> ('Juliana Melo', 'juliana@delivery.com', '85999990010', 'Fortaleza');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> INSERT INTO produtos (descricao, preco, estoque) VALUES
    -> ('X-Burguer Artesanal', 28.50, 50),
    -> ('Pizza Calabresa Grande', 45.00, 30),
    -> ('Batata Frita Suprema', 18.00, 100),
    -> ('Combo Temaki + Sunomono', 39.90, 40),
    -> ('Açaí Turbinado 500ml', 22.00, 60),
    -> ('Refrigerante Lata 350ml', 6.00, 200),
    -> ('Suco Natural Laranja 1L', 14.00, 80),
    -> ('Porção de Pastéis (6 un)', 24.00, 45),
    -> ('Brownie de Chocolate', 8.50, 70),
    -> ('Marmitex Executiva Frango', 25.00, 35);
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> INSERT INTO pedidos (id_cliente, id_produto, quantidade, data_pedido) VALUES
    -> (1, 1, 2, '2026-11-01'),
    -> (2, 2, 1, '2026-11-01'),
    -> (3, 3, 1, '2026-11-02'),
    -> (4, 4, 2, '2026-11-02'),
    -> (5, 5, 1, '2026-11-03'),
    -> (6, 6, 3, '2026-11-03'),
    -> (7, 7, 1, '2026-11-04'),
    -> (8, 8, 2, '2026-11-04'),
    -> (9, 9, 4, '2026-11-05'),
    -> (10, 10, 1, '2026-11-05');
Query OK, 10 rows affected (0.02 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> INSERT INTO entregas (id_pedido, entregador, endereco_entrega, status_entrega,
    -> valor_frete, data_saida, data_entrega) VALUES
    -> (1, 'Marcos Oliveira', 'Rua das Flores, 120 - São Paulo', 'Entregue', 5.00, '2026-11-01
    '> 19:00:00', '2026-11-01 19:35:00'),
    -> (2, 'Paulo Henrique', 'Av. Brasil, 450 - Campinas', 'Entregue', 6.00, '2026-11-01 20:10:00',
    -> '2026-11-01 20:50:00'),
    -> (3, 'Lucas Ferreira', 'Rua Copacabana, 88 - Rio de Janeiro', 'Entregue', 7.50, '2026-11-02
    '> 12:30:00', '2026-11-02 13:05:00'),
    -> (4, 'Rafael Gomes', 'Av. Afonso Pena, 900 - Belo Horizonte', 'Entregue', 5.50, '2026-11-02
    '> 19:45:00', '2026-11-02 20:20:00'),
    -> (5, 'Thiago Martins', 'Rua XV de Novembro, 300 - Curitiba', 'Entregue', 5.00, '2026-11-03
    '> 13:00:00', '2026-11-03 13:30:00'),
    -> (6, 'Marcos Oliveira', 'Rua dos Andradas, 75 - Porto Alegre', 'Entregue', 6.50, '2026-11-03
    '> 18:20:00', '2026-11-03 18:55:00'),
    -> (7, 'Paulo Henrique', 'SQS 308, Bloco B - Brasília', 'Cancelada', 8.00, NULL, NULL),
    -> (8, 'Lucas Ferreira', 'Av. Sete de Setembro, 210 - Salvador', 'Em rota', 7.00, '2026-11-04
    '> 20:00:00', NULL),
    -> (9, 'Rafael Gomes', 'Rua da Aurora, 55 - Recife', 'Em rota', 6.00, '2026-11-05 19:15:00',
    -> NULL),
    -> (10, 'Thiago Martins', 'Av. Beira Mar, 1000 - Fortaleza', 'Pendente', 9.00, NULL, NULL);
Query OK, 10 rows affected, 6 warnings (0.02 sec)
Records: 10  Duplicates: 0  Warnings: 6

mysql> SELECT * FROM produtos;
+------------+---------------------------+-------+---------+
| id_produto | descricao                 | preco | estoque |
+------------+---------------------------+-------+---------+
|          1 | X-Burguer Artesanal       | 28.50 |      50 |
|          2 | Pizza Calabresa Grande    | 45.00 |      30 |
|          3 | Batata Frita Suprema      | 18.00 |     100 |
|          4 | Combo Temaki + Sunomono   | 39.90 |      40 |
|          5 | Açaí Turbinado 500ml      | 22.00 |      60 |
|          6 | Refrigerante Lata 350ml   |  6.00 |     200 |
|          7 | Suco Natural Laranja 1L   | 14.00 |      80 |
|          8 | Porção de Pastéis (6 un)  | 24.00 |      45 |
|          9 | Brownie de Chocolate      |  8.50 |      70 |
|         10 | Marmitex Executiva Frango | 25.00 |      35 |
+------------+---------------------------+-------+---------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM pedidos;
+-----------+------------+------------+------------+-------------+
| id_pedido | id_cliente | id_produto | quantidade | data_pedido |
+-----------+------------+------------+------------+-------------+
|         1 |          1 |          1 |          2 | 2026-11-01  |
|         2 |          2 |          2 |          1 | 2026-11-01  |
|         3 |          3 |          3 |          1 | 2026-11-02  |
|         4 |          4 |          4 |          2 | 2026-11-02  |
|         5 |          5 |          5 |          1 | 2026-11-03  |
|         6 |          6 |          6 |          3 | 2026-11-03  |
|         7 |          7 |          7 |          1 | 2026-11-04  |
|         8 |          8 |          8 |          2 | 2026-11-04  |
|         9 |          9 |          9 |          4 | 2026-11-05  |
|        10 |         10 |         10 |          1 | 2026-11-05  |
+-----------+------------+------------+------------+-------------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM entregas;
+------------+-----------+-----------------+---------------------------------------+----------------+-------------+---------------------+---------------------+
| id_entrega | id_pedido | entregador      | endereco_entrega                      | status_entrega | valor_frete | data_saida          | data_entrega        |
+------------+-----------+-----------------+---------------------------------------+----------------+-------------+---------------------+---------------------+
|          1 |         1 | Marcos Oliveira | Rua das Flores, 120 - São Paulo       | Entregue       |        5.00 | 2026-11-01 19:00:00 | 2026-11-01 19:35:00 |
|          2 |         2 | Paulo Henrique  | Av. Brasil, 450 - Campinas            | Entregue       |        6.00 | 2026-11-01 20:10:00 | 2026-11-01 20:50:00 |
|          3 |         3 | Lucas Ferreira  | Rua Copacabana, 88 - Rio de Janeiro   | Entregue       |        7.50 | 2026-11-02 12:30:00 | 2026-11-02 13:05:00 |
|          4 |         4 | Rafael Gomes    | Av. Afonso Pena, 900 - Belo Horizonte | Entregue       |        5.50 | 2026-11-02 19:45:00 | 2026-11-02 20:20:00 |
|          5 |         5 | Thiago Martins  | Rua XV de Novembro, 300 - Curitiba    | Entregue       |        5.00 | 2026-11-03 13:00:00 | 2026-11-03 13:30:00 |
|          6 |         6 | Marcos Oliveira | Rua dos Andradas, 75 - Porto Alegre   | Entregue       |        6.50 | 2026-11-03 18:20:00 | 2026-11-03 18:55:00 |
|          7 |         7 | Paulo Henrique  | SQS 308, Bloco B - Brasília           | Cancelada      |        8.00 | NULL                | NULL                |
|          8 |         8 | Lucas Ferreira  | Av. Sete de Setembro, 210 - Salvador  | Em rota        |        7.00 | 2026-11-04 20:00:00 | NULL                |
|          9 |         9 | Rafael Gomes    | Rua da Aurora, 55 - Recife            | Em rota        |        6.00 | 2026-11-05 19:15:00 | NULL                |
|         10 |        10 | Thiago Martins  | Av. Beira Mar, 1000 - Fortaleza       | Pendente       |        9.00 | NULL                | NULL                |
+------------+-----------+-----------------+---------------------------------------+----------------+-------------+---------------------+---------------------+
10 rows in set (0.00 sec)

mysql> SELECT c.nome AS cliente, pr.descricao AS item, e.entregador, e.status_entrega,
    -> e.valor_frete, e.data_entrega
    -> FROM entregas e
    -> INNER JOIN pedidos p ON e.id_pedido = p.id_pedido
    -> INNER JOIN clientes c ON p.id_cliente = c.id_cliente
    -> INNER JOIN produtos pr ON p.id_produto = pr.id_produto;
+---------------+---------------------------+-----------------+----------------+-------------+---------------------+
| cliente       | item                      | entregador      | status_entrega | valor_frete | data_entrega        |
+---------------+---------------------------+-----------------+----------------+-------------+---------------------+
| Ana Silva     | X-Burguer Artesanal       | Marcos Oliveira | Entregue       |        5.00 | 2026-11-01 19:35:00 |
| Bruno Santos  | Pizza Calabresa Grande    | Paulo Henrique  | Entregue       |        6.00 | 2026-11-01 20:50:00 |
| Carlos Lima   | Batata Frita Suprema      | Lucas Ferreira  | Entregue       |        7.50 | 2026-11-02 13:05:00 |
| Daniela Souza | Combo Temaki + Sunomono   | Rafael Gomes    | Entregue       |        5.50 | 2026-11-02 20:20:00 |
| Eduardo Costa | Açaí Turbinado 500ml      | Thiago Martins  | Entregue       |        5.00 | 2026-11-03 13:30:00 |
| Fernanda Dias | Refrigerante Lata 350ml   | Marcos Oliveira | Entregue       |        6.50 | 2026-11-03 18:55:00 |
| Gabriel Alves | Suco Natural Laranja 1L   | Paulo Henrique  | Cancelada      |        8.00 | NULL                |
| Heloísa Rocha | Porção de Pastéis (6 un)  | Lucas Ferreira  | Em rota        |        7.00 | NULL                |
| Igor Mendes   | Brownie de Chocolate      | Rafael Gomes    | Em rota        |        6.00 | NULL                |
| Juliana Melo  | Marmitex Executiva Frango | Thiago Martins  | Pendente       |        9.00 | NULL                |
+---------------+---------------------------+-----------------+----------------+-------------+---------------------+
10 rows in set (0.00 sec)

mysql> SHOW TABLES;
+-----------------------+
| Tables_in_db_delivery |
+-----------------------+
| clientes              |
| entregas              |
| pedidos               |
| produtos              |
+-----------------------+
4 rows in set (0.02 sec)

mysql>



























