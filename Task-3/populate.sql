DELETE FROM delivery;
DELETE FROM supplier;
DELETE FROM contains;
DELETE FROM product;
DELETE FROM works;
DELETE FROM warehouse;
DELETE FROM office;
DELETE FROM workplace;
DELETE FROM department;
DELETE FROM process;
DELETE FROM employee;
DELETE FROM pay;
DELETE FROM "order";
DELETE FROM customer;

INSERT INTO customer (cust_no, name, email, phone, address)
VALUES
    (1, 'John Doe', 'johndoe@example.com', '912345678', 'Rua dos Pinheiros, 1357-246 Viseu'),
    (2, 'Jane Smith', 'janesmith@example.com', '933987654', 'Avenida da Praia, 9876-543 Cascais'),
    (3, 'Robert Johnson', 'robertjohnson@example.com', '968745321', 'Travessa da Esperança, 2468-135 Guimarães'),
    (4, 'Sarah Davis', 'sarahdavis@example.com', '925876543', 'Praça do Mercado, 5432-109 Évora'),
    (5, 'Michael Lee', 'michaellee@example.com', '919123456', 'Largo da Igreja, 7890-321 Aveiro'),
    (6, 'Laura Oliveira', 'lauraoliveira@example.com', '927364528', 'Avenida dos Plátanos, 1357-246 Vila Real'),
    (7, 'Carlos Silva', 'carlossilva@example.com', '933485920', 'Rua do Carmo, 9876-543 Funchal'),
    (8, 'Maria Santos', 'mariasantos@example.com', '912345670', 'Rua das Flores, 1357-246 Lisboa'),
    (9, 'Pedro Costa', 'pedrocosta@example.com', '933987699', 'Avenida Central, 9876-543 Porto'),
    (10, 'Ana Ferreira', 'anaferreira@example.com', '968745355', 'Travessa da Liberdade, 2468-135 Braga'),
    (11, 'Miguel Pereira', 'miguelpereira@example.com', '925876589', 'Praça da República, 5432-109 Coimbra'),
    (12, 'Sofia Ramos', 'sofiaramos@example.com', '919123444', 'Largo da Misericórdia, 7890-321 Faro'),
    (13, 'Ricardo Sousa', 'ricardosousa@example.com', '927364500', 'Avenida da Boavista, 1357-246 Matosinhos'),
    (14, 'Carolina Almeida', 'carolinaalmeida@example.com', '933485911', 'Rua das Gaivotas, 9876-543 Setúbal'),
    (15, 'António Gomes', 'antoniogomes@example.com', '912345601', 'Rua dos Lírios, 1357-246 Almada'),
    (16, 'Isabel Coelho', 'isabelcoelho@example.com', '933987622', 'Avenida dos Aliados, 9876-543 Vila Nova de Gaia'),
    (17, 'Hugo Machado', 'hugomachado@example.com', '968745333', 'Travessa das Oliveiras, 2468-135 Portimão'),
    (18, 'Mariana Gonçalves', 'marianagoncalves@example.com', '925876511', 'Praça do Comércio, 5432-109 Loulé'),
    (19, 'Tiago Rodrigues', 'tiagorodrigues@example.com', '919123422', 'Largo do Terreiro, 7890-321 Barcelos'),
    (20, 'Beatriz Nunes', 'beatriznunes@example.com', '927364512', 'Avenida 25 de Abril, 1357-246 Faro'),
    (21, 'Diogo Barbosa', 'diogobarbosa@example.com', '933485933', 'Rua dos Castanheiros, 9876-543 Bragança'),
    (22, 'Inês Santos', 'inessantos@example.com', '912345612', 'Rua das Oliveiras, 1357-246 Viana do Castelo'),
    (23, 'Rui Costa', 'ruicosta@example.com', '933987644', 'Avenida Infante Dom Henrique, 9876-543 Santarém'),
    (24, 'Catarina Ferreira', 'catarinaferreira@example.com', '968745377', 'Travessa dos Cravos, 2468-135 Leiria'),
    (25, 'Gonçalo Martins', 'goncalomartins@example.com', '925876522', 'Praça da Liberdade, 5432-109 Covilhã'),
    (26, 'Luísa Oliveira', 'luisaoliveira@example.com', '919123433', 'Largo do Pelourinho, 7890-321 Albufeira'),
    (27, 'André Silva', 'andresilva@example.com', '927364523', 'Avenida da República, 1357-246 Guarda'),
    (28, 'Margarida Sousa', 'margaridasousa@example.com', '933485944', 'Rua do Sol, 9876-543 Viseu'),
    (29, 'João Rodrigues', 'joaorodrigues@example.com', '912345623', 'Rua dos Cravos, 1357-246 Cascais'),
    (30, 'Sara Santos', 'sarasantos@example.com', '933987655', 'Avenida do Mar, 9876-543 Guimarães'),
    (31, 'Hugo Fernandes', 'hugofernandes@example.com', '968745388', 'Travessa dos Lírios, 2468-135 Évora'),
    (32, 'Inês Oliveira', 'inesoliveira@example.com', '925876533', 'Praça dos Restauradores, 5432-109 Aveiro'),
    (33, 'Diogo Pereira', 'diogopereira@example.com', '919123444', 'Largo da Misericórdia, 7890-321 Vila Real'),
    (34, 'Rita Costa', 'ritacosta@example.com', '927364534', 'Avenida da Boavista, 1357-246 Funchal'),
    (35, 'Miguel Almeida', 'miguelalmeida@example.com', '933485955', 'Rua das Gaivotas, 9876-543 Lisboa'),
    (36, 'Luana Gomes', 'luanagomes@example.com', '912345634', 'Rua dos Lírios, 1357-246 Porto'),
    (37, 'David Santos', 'davidsantos@example.com', '933987666', 'Avenida dos Aliados, 9876-543 Braga'),
    (38, 'Carolina Oliveira', 'carolinaoliveira@example.com', '968745399', 'Travessa das Oliveiras, 2468-135 Coimbra'),
    (39, 'André Rodrigues', 'andrerodrigues@example.com', '925876544', 'Praça do Comércio, 5432-109 Faro'),
    (40, 'Mariana Nunes', 'mariananunes@example.com', '919123455', 'Largo do Terreiro, 7890-321 Matosinhos'),
    (41, 'Gustavo Barbosa', 'gustavobarbosa@example.com', '927364545', 'Avenida 25 de Abril, 1357-246 Setúbal'),
    (42, 'Joana Santos', 'joanasantos@example.com', '933485966', 'Rua dos Castanheiros, 9876-543 Almada'),
    (43, 'Rafael Costa', 'rafaelcosta@example.com', '912345645', 'Rua das Oliveiras, 1357-246 Vila Nova de Gaia'),
    (44, 'Sofia Ferreira', 'sofiaferreira@example.com', '933987677', 'Avenida Infante Dom Henrique, 9876-543 Portimão'),
    (45, 'Leonardo Gomes', 'leonardogomes@example.com', '968745400', 'Travessa dos Cravos, 2468-135 Loulé'),
    (46, 'Ana Martins', 'anamartins@example.com', '925876555', 'Praça da Liberdade, 5432-109 Barcelos'),
    (47, 'Bruno Silva', 'brunosilva@example.com', '919123466', 'Largo do Pelourinho, 7890-321 Faro'),
    (48, 'Carla Sousa', 'carlasousa@example.com', '927364556', 'Avenida da República, 1357-246 Bragança'),
    (49, 'Ricardo Santos', 'ricardosantos@example.com', '933485977', 'Rua do Sol, 9876-543 Viana do Castelo'),
    (50, 'Mariana Oliveira', 'marianaoliveira@example.com', '912345656', 'Rua dos Cravos, 1357-246 Santarém');

START TRANSACTION;
SET CONSTRAINTS ALL DEFERRED;

INSERT INTO "order" (order_no, cust_no, date)
VALUES
    (1, 1, '2022-06-01'),
    (2, 2, '2022-06-02'),
    (3, 3, '2022-07-03'),
    (4, 4, '2022-12-04'),
    (5, 5, '2022-02-05'),
    (6, 6, '2022-06-06'),
    (7, 7, '2022-06-06'),
    (8, 1, '2022-03-02'),
    (9, 6, '2022-09-30'),
    (10, 2, '2022-10-25'),
    (11, 3, '2022-10-12'),
    (12, 2, '2022-12-03'),
    (13, 8, '2022-01-01'),
    (14, 9, '2022-02-02'),
    (15, 10, '2022-03-03'),
    (16, 11, '2022-04-04'),
    (17, 12, '2022-12-03'),
    (18, 13, '2022-10-12'),
    (19, 14, '2022-07-07'),
    (20, 15, '2022-06-02'),
    (21, 16, '2022-07-03'),
    (22, 17, '2022-06-01');

INSERT INTO product (SKU, name, description, price, ean)
VALUES
    ('SKU001', 'Product 1', 'Description 1', 1, 1234567890123),
    ('SKU002', 'Product 2', 'Description 2', 5, 9876543210987),
    ('SKU003', 'Product 3', 'Description 3', 10, 1111111111111),
    ('SKU004', 'Product 4', 'Description 4', 30, 2222222222222),
    ('SKU005', 'Product 5', 'Description 5', 50, 3333333333333),
    ('SKU006', 'Product 6', 'Description 6', 100, 4444444444444),
    ('SKU007', 'Product 7', 'Description 7', 40, 6666666666666),
    ('SKU008', 'Product 8', 'Description 8', 20, 7777777777777),
    ('SKU009', 'Product 9', 'Description 9', 15, 8888888888888),
    ('SKU010', 'Product 10', 'Description 10', 25, 9999999999999),
    ('SKU011', 'Product 11', 'Description 11', 12, 1111111111112),
    ('SKU012', 'Product 12', 'Description 12', 8, 2222222222223),
    ('SKU013', 'Product 13', 'Description 13', 35, 3333333333334),
    ('SKU014', 'Product 14', 'Description 14', 18, 4444444444445),
    ('SKU015', 'Product 15', 'Description 15', 22, 5555555555556),
    ('SKU016', 'Product 16', 'Description 16', 28, 6666666666667),
    ('SKU017', 'Product 17', 'Description 17', 40, 7777777777778),
    ('SKU018', 'Product 18', 'Description 18', 14, 8888888888889),
    ('SKU019', 'Product 19', 'Description 19', 32, 9999999999990),
    ('SKU020', 'Product 20', 'Description 20', 7, 1111111111113),
    ('SKU021', 'Product 21', 'Description 21', 19, 2222222222224),
    ('SKU022', 'Product 22', 'Description 22', 9, 3333333333335),
    ('SKU023', 'Product 23', 'Description 23', 33, 4444444444446),
    ('SKU024', 'Product 24', 'Description 24', 11, 5555555555557),
    ('SKU025', 'Product 25', 'Description 25', 26, 6666666666668),
    ('SKU026', 'Product 26', 'Description 26', 17, 7777777777779),
    ('SKU027', 'Product 27', 'Description 27', 23, 8888888888890),
    ('SKU028', 'Product 28', 'Description 28', 36, 9999999999991),
    ('SKU029', 'Product 29', 'Description 29', 13, 1111111111114),
    ('SKU030', 'Product 30', 'Description 30', 31, 2222222222225),
    ('SKU031', 'Product 31', 'Description 31', 6, 3333333333336),
    ('SKU032', 'Product 32', 'Description 32', 21, 4444444444447),
    ('SKU033', 'Product 33', 'Description 33', 24, 5555555555558),
    ('SKU034', 'Product 34', 'Description 34', 27, 6666666666669),
    ('SKU035', 'Product 35', 'Description 35', 16, 7777777777780),
    ('SKU036', 'Product 36', 'Description 36', 34, 8888888888891),
    ('SKU037', 'Product 37', 'Description 37', 10, 9999999999992),
    ('SKU038', 'Product 38', 'Description 38', 29, 1111111111115),
    ('SKU039', 'Product 39', 'Description 39', 3, 2222222222226),
    ('SKU040', 'Product 40', 'Description 40', 38, 3333333333337),
    ('SKU041', 'Product 41', 'Description 41', 9, 4444444444448),
    ('SKU042', 'Product 42', 'Description 42', 37, 5555555555559),
    ('SKU043', 'Product 43', 'Description 43', 4, 6666666666670),
    ('SKU044', 'Product 44', 'Description 44', 39, 7777777777781),
    ('SKU045', 'Product 45', 'Description 45', 30, 8888888888892),
    ('SKU046', 'Product 46', 'Description 46', 2, 9999999999993),
    ('SKU047', 'Product 47', 'Description 47', 42, 1111111111116),
    ('SKU048', 'Product 48', 'Description 48', 48, 2222222222227),
    ('SKU049', 'Product 49', 'Description 49', 50, 3333333333338),
    ('SKU050', 'Product 50', 'Description 50', 46, 4444444444449);

INSERT INTO contains (order_no, SKU, qty)
VALUES
    (1, 'SKU001', 2),
    (2, 'SKU002', 1),
    (3, 'SKU003', 3),
    (4, 'SKU004', 2),
    (5, 'SKU007', 4),
    (6, 'SKU006', 16),
    (7, 'SKU007', 9),
    (8, 'SKU003', 7),
    (9, 'SKU002', 12),
    (10, 'SKU006', 2),
    (11, 'SKU005', 10),
    (12, 'SKU005', 1),
    (13, 'SKU001', 3),
    (13, 'SKU002', 2),
    (13, 'SKU003', 1),
    (13, 'SKU004', 4),
    (13, 'SKU005', 3),
    (14, 'SKU006', 2),
    (14, 'SKU007', 1),
    (14, 'SKU008', 2),
    (14, 'SKU009', 3),
    (14, 'SKU010', 1),
    (15, 'SKU011', 4),
    (15, 'SKU012', 3),
    (15, 'SKU013', 2),
    (15, 'SKU014', 1),
    (15, 'SKU015', 4),
    (16, 'SKU016', 1),
    (16, 'SKU017', 2),
    (16, 'SKU018', 3),
    (16, 'SKU019', 2),
    (16, 'SKU020', 1),
    (17, 'SKU021', 4),
    (17, 'SKU022', 1),
    (17, 'SKU023', 2),
    (17, 'SKU024', 3),
    (17, 'SKU025', 2),
    (18, 'SKU026', 3),
    (18, 'SKU027', 1),
    (18, 'SKU028', 2),
    (18, 'SKU029', 2),
    (18, 'SKU030', 3),
    (19, 'SKU031', 4),
    (19, 'SKU032', 2),
    (19, 'SKU033', 1),
    (19, 'SKU034', 2),
    (19, 'SKU035', 1),
    (20, 'SKU036', 3),
    (20, 'SKU037', 2),
    (20, 'SKU038', 2),
    (20, 'SKU039', 1),
    (20, 'SKU040', 4),
    (21, 'SKU041', 1),
    (21, 'SKU042', 2),
    (21, 'SKU043', 3),
    (21, 'SKU044', 4),
    (21, 'SKU045', 1),
    (22, 'SKU046', 2),
    (22, 'SKU047', 1),
    (22, 'SKU048', 2),
    (22, 'SKU049', 3),
    (22, 'SKU050', 2);

SET CONSTRAINTS ALL IMMEDIATE;
COMMIT;

INSERT INTO pay (order_no, cust_no)
VALUES
    (1, 1),
    (2, 2),
    (3, 2),
    (4, 4),
    (5, 2),
    (6, 5),
    (7, 2),
    (8, 2),
    (9, 6),
    (10, 7),
    (11, 5),
    (12, 4);

INSERT INTO employee (ssn, TIN, bdate, name)
VALUES
    ('123456789', 'TIN001', '2005-06-15', 'John Smith'),
    ('987654321', 'TIN002', '1985-05-10', 'Jane Doe'),
    ('111222333', 'TIN003', '1995-12-25', 'Robert Johnson'),
    ('444555666', 'TIN004', '1988-07-15', 'Sarah Davis'),
    ('777888999', 'TIN005', '1992-03-20', 'Michael Lee'),
    ('111111111', 'TIN006', '1990-09-30', 'Laura Oliveira'),
    ('222222222', 'TIN007', '1989-11-12', 'Carlos Silva');

INSERT INTO process (ssn, order_no)
VALUES
    ('222222222', 1),
    ('222222222', 2),
    ('222222222', 3),
    ('777888999', 4),
    ('777888999', 5),
    ('222222222', 6),
    ('777888999', 7),
    ('777888999', 8),
    ('777888999', 9),
    ('777888999', 10),
    ('222222222', 11),
    ('222222222', 12),
    ('777888999', 13),
    ('777888999', 14),
    ('777888999', 15),
    ('777888999', 16),
    ('777888999', 17),
    ('777888999', 18),
    ('777888999', 19),
    ('777888999', 20),
    ('777888999', 21),
    ('777888999', 22);

INSERT INTO department (name)
VALUES
    ('Sales'),
    ('Marketing'),
    ('HR'),
    ('Finance'),
    ('IT'),
    ('Logistics');

START TRANSACTION;
SET CONSTRAINTS ALL DEFERRED;

INSERT INTO workplace (address, lat, long)
VALUES
    ('Rua do Comércio, 1234-567 Lisboa', 37.123456, -122.987654),
    ('Avenida Central, 9876-543 Porto', 38.987654, -121.123456),
    ('Travessa dos Lírios, 2468-135 Coimbra', 39.456789, -120.654321),
    ('Praça da Liberdade, 5432-109 Braga', 40.135792, -119.97531),
    ('Largo da Fonte, 7890-321 Faro', 41.246813, -118.357924),
    ('Rua das Oliveiras, 1357-246 Leiria', 42.123456, -117.987654);

INSERT INTO office (address)
VALUES
    ('Rua do Comércio, 1234-567 Lisboa'),
    ('Avenida Central, 9876-543 Porto'),
    ('Praça da Liberdade, 5432-109 Braga');

INSERT INTO warehouse (address)
VALUES
    ('Travessa dos Lírios, 2468-135 Coimbra'),
    ('Largo da Fonte, 7890-321 Faro'),
    ('Rua das Oliveiras, 1357-246 Leiria');
SET CONSTRAINTS ALL IMMEDIATE;
COMMIT;

INSERT INTO works (ssn, name, address)
VALUES
    ('123456789', 'IT', 'Rua do Comércio, 1234-567 Lisboa'),
    ('987654321', 'Marketing', 'Avenida Central, 9876-543 Porto'),
    ('111222333', 'HR', 'Travessa dos Lírios, 2468-135 Coimbra'),
    ('444555666', 'Finance', 'Travessa dos Lírios, 2468-135 Coimbra'),
    ('777888999', 'Sales', 'Largo da Fonte, 7890-321 Faro'),
    ('111111111', 'Logistics', 'Rua das Oliveiras, 1357-246 Leiria'),
    ('222222222', 'Sales', 'Rua das Oliveiras, 1357-246 Leiria');

INSERT INTO supplier (TIN, name, address, SKU, date)
VALUES
    ('TIN001', 'Supplier 1', 'Rua dos Cravos, 123, 4560-123 Amarante', 'SKU001', '2016-09-12'),
    ('TIN002', 'Supplier 2', 'Avenida da Liberdade, 987, 1250-096 Lisboa', 'SKU002', '2021-03-28'),
    ('TIN003', 'Supplier 3', 'Travessa das Flores, 456, 3000-123 Coimbra', 'SKU003', '2017-11-05'),
    ('TIN004', 'Supplier 4', 'Praça do Comércio, 789, 1100-148 Lisboa', 'SKU004', '2019-08-19'),
    ('TIN005', 'Supplier 5', 'Largo da Sé, 321, 4000-123 Porto', 'SKU005', '2022-06-10'),
    ('TIN006', 'Supplier 6', 'Rua da República, 654, 1500-543 Lisboa', 'SKU006', '2022-01-20'),
    ('TIN007', 'Supplier 7', 'Avenida Central, 789, 5000-098 Vila Real', 'SKU007', '2015-08-13');

INSERT INTO delivery (address, TIN)
VALUES
    ('Travessa dos Lírios, 2468-135 Coimbra', 'TIN001'),
    ('Largo da Fonte, 7890-321 Faro', 'TIN002'),
    ('Travessa dos Lírios, 2468-135 Coimbra', 'TIN003'),
    ('Largo da Fonte, 7890-321 Faro', 'TIN004'),
    ('Rua das Oliveiras, 1357-246 Leiria', 'TIN006'),
    ('Rua das Oliveiras, 1357-246 Leiria', 'TIN007'),
    ('Largo da Fonte, 7890-321 Faro', 'TIN005');