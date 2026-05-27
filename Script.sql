create table Cliente (
	Id serial primary key,
	Nome varchar(100) not null,
	Email varchar(100),
	Genero varchar(1) not null,
	DataNascimento date not null
)

insert into Cliente 
(Nome, Email, Genero, DataNascimento)
values 
('João da Silva', 'joao@email.com', 'M', '1990-05-12')

insert into Cliente 
(Nome, Genero, DataNascimento)
values 
('Maria', 'F', '1988-09-23')

-- seleciona todas as colunas de cliente
select *
from Cliente

-- seleciona somente o nome e email de cliente
select Nome, Email
from Cliente

-- seleciona todas as colunas de cliente
select Id, Nome, Email, Genero, DataNascimento
from Cliente

-- Seleciona todas as colunas onde o Nome do cliente é Maria Souza
select *
from Cliente 
where Nome = 'Maria Souza'

-- Seleciona todos os clientes do gênero M
select *
from Cliente 
where Genero = 'M'

-- Seleciona todas as colunas de cliente ordenado por DataNascimento
select *
from Cliente 
order by DataNascimento

-- Seleciona todas as colunas de cliente ordenado por DataNascimento
-- por ordem decrescente
select *
from Cliente 
order by DataNascimento desc

-- atualiza email de cliente cujo id é igual a 2
update Cliente
set Email = 'maria.souza@email.com'
where Id = 2

delete from Cliente
where id = 4

create table Produtos (
	Id serial primary key,
	Nome varchar(100) not null,
	Preco decimal(10,2) not null,
	Estoque int
)