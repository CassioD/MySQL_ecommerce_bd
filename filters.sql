show databases;
use ecommerce;
show tables;

-- Verificação dos dados inseridos com select statement

SELECT *
FROM clients;

SELECT *
FROM product;

SELECT *
FROM payments;

SELECT *
FROM orders;

SELECT *
FROM productStorage;

SELECT *
FROM supplier;

SELECT *
FROM productSeller;

SELECT *
FROM productOrder;

SELECT *
FROM storageLocation;

SELECT *
FROM productSupplier;


-- FILTROS COM CONDICIONAIS, CONCATENAÇÃO, AGRUPAMENTO E ORDENAÇÃO

-- Nomes dos clientes concatenados e em ordem alfabética
SELECT concat(Fname, ' ', Lname) as client_name, CPF, Address
	FROM clients
    ORDER BY client_name ASC;

-- produtos recomendados para crianças em ordem alfabética
SELECT idProduct, Pname, category, evaluation, size
	FROM product
	WHERE classification_kids = 1
	order by Pname;

-- Soma dos limites agrupados por forma de pagamento
SELECT
  typePayment,
  SUM(limitAvailable) AS soma
FROM
  payments
GROUP BY
  typePayment;

-- Contagem de pedidos agrupados por status
SELECT orderStatus, count(orderStatus)
	FROM orders
    group by orderStatus;

-- Quantos pedidos foram feitos por cada cliente?
select concat(Fname, ' ', Lname) as full_name, count(idOrder) 
	from orders JOIN clients on idOrderClient = idClient
    group by full_name;

-- Algum vendedor também é fornecedor?
SELECT seller.socialName 
	FROM supplier JOIN seller on supplier.socialName = seller.socialName;


-- Relação de produtos fornecedores e estoque (Nome, quantidade, preço unitário, preço total, local armazenado.
SELECT Pname, quantity, evaluation, round(evaluation*quantity,2) as total, location
	FROM productSupplier JOIN storagelocation on idPsProduct = idLproduct JOIN product on idLproduct = idProduct;

-- Relação de nomes dos fornecedores e nomes dos produtos
SELECT socialName, CNPJ, contact, Pname, category, evaluation, size
	FROM supplier JOIN productSupplier ON idSupplier = idPsSupplier JOIN product ON idPsProduct = idProduct;