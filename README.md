# MySQL_ecommerce_bd

## Resumo

Este diretório contém um projeto de banco de dados MySQL para um e-commerce. O projeto inclui três arquivos SQL:

* **Desafio de projeto ecommerce MySQL.sql:** Este arquivo cria a estrutura do banco de dados.
* **data_insertion.sql:** Este arquivo insere alguns dados de teste nas tabelas do banco de dados.
* **filters.sql:** Este arquivo contém as consultas SQL para buscar e filtrar os dados do banco de dados.

## Instruções

Para executar o projeto, siga estas instruções:

1. Crie um banco de dados MySQL chamado `ecommerce`.
2. Importe o arquivo `Desafio de projeto ecommerce MySQL.sql` para o banco de dados `ecommerce`.
3. Importe o arquivo `data_insertion.sql` para o banco de dados `ecommerce`.
4. Execute as consultas SQL contidas no arquivo `filters.sql` para buscar e filtrar os dados do banco de dados.

## Explicação

O arquivo `Desafio de projeto ecommerce MySQL.sql` cria a estrutura do banco de dados, incluindo as seguintes tabelas:

```sql
-- criação do banco de dados para o cenário de E-commerce
show databases;
-- drop database ecommerce;
create database ecommerce;
use ecommerce;
show tables;

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(30),
    constraint unique_cpf_client unique (CPF)
);

alter table clients
add column typeClient enum ('PF', 'PJ') not null default 'PF',
add constraint unique_cpf_client_type unique (CPF, typeClient);

select * from clients;
-- criar tabela produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(10),
    classification_kids bool default false,
    category enum ('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    evaluation float default 0,
    size varchar(20)
);

-- criar tabela pagamento
create table payments(
	idClient int,
    idPayment int,
    typePayment enum ('Boleto', 'Cartão', 'Dois Cartões'),
    limitAvailable float,
    primary key (idClient, idPayment)
);

-- criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum ('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash boolean default false,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
		on update cascade
);

-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar (255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    abstName varchar(255),
    CNPJ char(15),
    CPF char(11),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);


create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);

create table productOrder (
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_product_order_seller foreign key (idPOproduct) references product (idProduct),
    constraint fk_product_order_product foreign key (idPOorder) references orders (idOrder)
);

create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);

show tables;
```

O arquivo `data_insertion.sql` insere alguns dados de teste nas tabelas do banco de dados. Os dados de teste incluem os seguintes produtos:

```sql
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
```

Os dados de teste incluem também os seguintes clientes:

```sql
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
```

O arquivo `filters.sql` contém as consultas SQL para buscar e filtrar os dados do banco de dados. As consultas SQL incluem os seguintes exemplos:

```sql
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
```

**Conclusão**

Este projeto é um exemplo simples de como criar um modelo de banco de dados para um e-commerce. O projeto inclui também alguns exemplos de consultas SQL para buscar e filtrar os dados do banco de dados.

**Modificações**

Você pode modificar o projeto para atender às suas necessidades específicas. Por exemplo, você pode adicionar novas tabelas, colunas ou restrições. Você também pode modificar as consultas SQL para implementar novos recursos.

**Agradecimentos**

Este projeto foi criado para o Desafio de Projeto da DIO. Agradeço à DIO e a [Juliana Mascarenhas](https://github.com/julianazanelatto) pela oportunidade de aprender e praticar minhas habilidades de desenvolvimento de banco de dados.

**Autor**

CassioD
[LinkedIn](https://www.linkedin.com/in/cassiodans/)
