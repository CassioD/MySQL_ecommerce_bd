show databases;
use ecommerce;

-- Populando a tabela clients
INSERT INTO clients (Fname, Minit, Lname, CPF, Address)
VALUES
('João', 'S', 'Silva', '12345678901', 'Rua das Flores, 10'),
('Maria', 'A', 'Souza', '98765432109', 'Av Paulista, 200'),
('Pedro', 'H', 'Santos', '45678912305', 'Rua do Sol, 30'),
('Ana', 'C', 'Oliveira', '32145698707', 'Rua da Lua, 40'),
('Carlos', 'R', 'Pereira', '65432178908', 'Av Brasil, 50'),
('Camila', 'F', 'Alves', '78965412306', 'Rua das Estrelas, 60'),
('Paulo', 'L', 'Ferreira', '95175385204', 'Rua do Mar, 70'),
('Beatriz', 'M', 'Ribeiro', '25836974103', 'Rua da Montanha, 80'),
('Rafael', 'S', 'Gomes', '14725836902', 'Av Ipiranga, 90'),
('Juliana', 'T', 'Correia', '36914725801', 'Rua do Vento, 100');

-- Populando a tabela product
INSERT INTO product (Pname, classification_kids, category, evaluation, size)
VALUES
('Smartphone', false, 'Eletrônico', 45, '5 pol'),
('Notebook', false, 'Eletrônico', 48, '15 pol'),
('Camiseta', false, 'Vestimenta', 42, 'M'),
('Calça', false, 'Vestimenta', 39, 'G'),
('Boneca', true, 'Brinquedos', 47, '40 cm'),
('Carrinho', true, 'Brinquedos', 46, '30 cm'),
('Chocolate', false, 'Alimentos', 50, '100g'),
('Biscoitos', false, 'Alimentos', 43, '200g'),
('Sofá', false, 'Móveis', 41, '3 lugares'),
('Estante', false, 'Móveis', 38, '2 portas');

-- Populando a tabela payments
INSERT INTO payments (idClient, idPayment, typePayment, limitAvailable)
VALUES
(1, 1, 'Cartão', 5000),
(1, 2, 'Boleto', 1000),
(2, 1, 'Dois Cartões', 8000),
(3, 1, 'Boleto', 2000),
(4, 1, 'Cartão', 3000),
(5, 1, 'Dois Cartões', 6000),
(6, 1, 'Boleto', 1500),
(7, 1, 'Cartão', 4500),
(8, 1, 'Dois Cartões', 7500),
(9, 1, 'Boleto', 2500);

-- Populando a tabela orders
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
VALUES
(1, 'Confirmado', 'Compra de um Smartphone', 1000, false),
(2, 'Em processamento', 'Compra de um Notebook', 2000, false),
(3, 'Cancelado', 'Compra de uma Camiseta', 300, true),
(4, 'Confirmado', 'Compra de uma Calça Jeans', 400, false),
(5, 'Em processamento', 'Compra de uma Boneca', 500, false),
(6, 'Cancelado', 'Compra de um Carrinho', 600, true),
(7, 'Confirmado', 'Compra de um Chocolate', 700, false),
(8, 'Em processamento', 'Compra de Biscoitos', 800, false),
(9, 'Cancelado', 'Compra de um Sofá', 900, true),
(10, 'Confirmado', 'Compra de uma Estante', 1000, false);

-- Populando a tabela productStorage
INSERT INTO productStorage (storageLocation, quantity)
VALUES
('Armazém 1', 100),
('Armazém 2', 200),
('Armazém 3', 300);

-- Populando a tabela supplier
INSERT INTO supplier (socialName, CNPJ, contact)
VALUES
('Samsung', '12345678000111', '1234567890'),
('Dell', '98765432000122', '9876543210'),
('C&A', '45678912000133', '4567891230'),
('Levis', '32145698000144', '3214569870'),
('Lego', '65432178000155', '6543217890'),
('Carrinho de Bebê', '78965412000166', '7896541230'),
('Nestlé', '95175385200404', '9517538520'),
('Mondelez', '25836974100103', '2583697410'),
('Sofá Móveis', '14725836900112', '1472583690'),
('Estante Madeira', '36914725800121', '3691472580');

-- Populando a tabela seller
INSERT INTO seller (socialName, abstName, CNPJ, CPF, location, contact)
VALUES
('João da Silva', 'da Silva', '12345678000111', '12345678901', 'Rua das Flores, 10', '1234567890'),
('Maria Souza', 'Souza', '98765432000122', '98765432109', 'Av Paulista, 200', '9876543210'),
('Pedro Santos', 'Santos', '45678912000133', '45678912305', 'Rua do Sol, 30', '4567891230'),
('Ana Oliveira', 'Oliveira', '32145698000144', '32145698707', 'Rua da Lua, 40', '3214569870'),
('Carlos Pereira', 'Pereira', '65432178000155', '65432178908', 'Av Brasil, 50', '6543217890');


-- Populando a tabela productSeller
INSERT INTO productSeller (idPseller, idPproduct, prodQuantity)
VALUES
(1, 1, 10),
(2, 2, 15),
(3, 3, 20),
(4, 4, 25),
(5, 5, 30),
(2, 6, 35),
(3, 7, 40),
(4, 8, 45),
(5, 9, 50),
(1, 10, 55);

-- Populando a tabela productOrder
INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
VALUES
(1, 1, 1, 'Sem estoque'),
(2, 2, 1, 'Disponível'),
(3, 3, 1, 'Sem estoque'),
(4, 4, 1, 'Disponível'),
(5, 5, 1, 'Disponível'),
(6, 6, 1, 'Sem estoque'),
(7, 7, 1, 'Disponível'),
(8, 8, 1, 'Disponível'),
(9, 9, 1, 'Sem estoque'),
(10, 10, 1, 'Disponível');

-- Populando a tabela storageLocation
INSERT INTO storageLocation (idLproduct, idLstorage, location)
VALUES
(1, 1, 'Armazém 1'),
(2, 2, 'Armazém 2'),
(3, 3, 'Armazém 3'),
(4, 1, 'Armazém 2'),
(5, 2, 'Armazém 1'),
(6, 3, 'Armazém 2'),
(7, 1, 'Armazém 3'),
(8, 2, 'Armazém 1'),
(9, 3, 'Armazém 2'),
(10, 1, 'Armazém 3');

-- Populando a tabela productSupplier
INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity)
VALUES
(1, 1, 100),
(2, 2, 150),
(3, 3, 200),
(4, 4, 250),
(5, 5, 300),
(6, 6, 350),
(7, 7, 400),
(8, 8, 450),
(9, 9, 500),
(10, 10, 550);