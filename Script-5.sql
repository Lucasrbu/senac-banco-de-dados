create table Cidade (
	Id serial primary key,
	Nome varchar(100) not null,
	Estado varchar(2) not null
)

insert into Cidade(Nome, Estado) values
('São Paulo', 'SP'),
('Rio de Janeiro', 'RJ'),
('Belo Horizonte', 'MG'),
('Curitiba', 'PR'),
('Fortaleza', 'CE')

alter table usuario 
add column CidadeId int;

update usuario set CidadeId = 3 where id = 1

update usuario set CidadeId = 3 where id = 2

update usuario set CidadeId = 2 where id = 3

update usuario set CidadeId = 1 where id = 4

update usuario set CidadeId = 3 where id = 5

update usuario set CidadeId = 2 where id = 6

select * from Usuario

select * from Cidade

select u.nome, c.nome from Usuario u inner join Cidade c on u.cidadeid = c.id

select u.id, u.nome, u.cpf, c.nome as NomeCidade, c.estado from Cidade c left join usuario u on u.cidadeid = c.id order by u.nome

select u.id, u.nome, u.cpf, c.nome as NomeCidade, c.estado from Cidade c right join usuario u on u.cidadeid = c.id

create table Passaporte (
	Id serial primary key,
	Numero varchar ,
	Usuario int unique,
	foreign key (UsuarioId) references Usuario(Id)
)

insert into Passaporte (Numero, UsuarioId) values ('BR10001', 1)

insert into Passaporte (Numero, UsuarioId) values ('BR10002', 2)

insert into Passaporte (Numero, UsuarioId) values ('BR10003', 3)

insert into Passaporte (Numero, UsuarioId) values ('BR10004', 4)

insert into Passaporte (Numero, UsuarioId) values ('BR10005', 5)

insert into Passaporte (Numero, UsuarioId) values ('BR10006', 6)

insert into Passaporte (Numero, UsuarioId) values ('BR10007', 7)

insert into Passaporte (Numero, UsuarioId) values ('BR10008', 8)

insert into Passaporte (Numero, UsuarioId) values ('BR10009', 9)

insert into Passaporte (Numero, UsuarioId) values ('BR100010', 10)

select u.nome, u.cpf, p.numero, p.usuarioid from usuario u inner join passaporte p on u.id = p.usuarioid where u.id = 2

slect p.id, p.valortotal, u.id as usuarioid, u.nome as usuario inner join padido p on p.usuarioid = 2 where u.id = 2

CREATE TABLE Produto (
	Id SERIAL PRIMARY KEY,
	Nome VARCHAR(150) NOT NULL,
	Descricao TEXT,
	Preco DECIMAL(10,2) NOT NULL,
	Estoque INT DEFAULT 0,
	Ativo BOOLEAN DEFAULT TRUE,
	CriadoEm TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	AtualizadoEm TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 

INSERT INTO Produto (Nome, Descricao, Preco, Estoque)
VALUES
('Mouse Gamer', 'Mouse RGB 7200 DPI', 150.00, 25),
('Teclado Mecânico', 'Teclado switch blue', 350.00, 15),
('Monitor 24"', 'Monitor Full HD IPS', 899.90, 10),
('Headset Gamer', 'Headset com microfone', 250.75, 20),
('Notebook i5', 'Notebook 16GB RAM SSD 512GB', 4500.00, 5),
('Cadeira Gamer', 'Cadeira ergonômica reclinável', 1200.50, 8),
('Webcam HD', 'Webcam 1080p', 89.90, 30),
('Mousepad XXL', 'Mousepad extra grande', 45.00, 40),
('SSD 1TB', 'SSD NVMe Gen4', 560.00, 12),
('Fonte 650W', 'Fonte modular 80 Plus Bronze', 310.20, 18);

select * from produto

INSERT INTO PediProdutos
(PedidoId, ProdutoId, Quantidade, ValorUnitario, ValorTotal)
VALUES
(1, 8, 3, 45.00, 135.00),
(1, 1, 1, 115.75, 115.75),
(2, 7, 1, 89.90, 89.90),
(3, 8, 4, 45.00, 180.00),
(3, 1, 2, 150.00, 300.00),
(3, 7, 1, 80.00, 80.00),
(4, 8, 2, 45.00, 90.00),
(4, 1, 1, 30.50, 30.50),
(5, 3, 1, 899.90, 899.90),
(5, 8, 2, 45.00, 90.00),
(5, 1, 1, 10.09, 10.09),
(6, 8, 1, 45.00, 45.00),
(7, 8, 2, 45.00, 90.00),
(7, 1, 1, 150.00, 150.00),
(7, 7, 2, 35.10, 70.20),
(8, 9, 1, 560.00, 560.00),
(8, 8, 2, 45.00, 90.00),
(8, 1, 1, 130.40, 130.40),
(9, 8, 2, 45.00, 90.00),
(9, 1, 2, 30.00, 60.00),
(10, 8, 1, 45.00, 45.00),
(10, 1, 3, 7.63, 22.89);

create table PediProdutos (
	id serial primary key,
	PedidoId int not null,
	ProdutoId int not null,
	quantidade int not null,
	ValorUnitario numeric(10,2) not null,
	ValorTotal numeric(10,2) not null,
	foreign key (PedidoId) references Pedido(Id),
	foreign key (ProdutoId) references Produto(Id)
)

select * from pedido

-- 1- mostrar pedidos com o valor entre 100 e 500
select * from pedido where valortotal between 100 and 500

-- 2- contar quantos usuários que usam outlook existem cadastrados
select count(u.id) as totalusuario
from usuario u
where u.email ilike '%outlook%'

-- 3- mostrar os dados dos pedidos de maior valor
select * from pedido p 
where valortotal = (select max(valortotal) from pedido) 

-- 4- mostrar os dados de produto de menor preço
select * from produto p 
where preco = (select min(preco) from produto) 

-- 5- mostrar a média de preço dos produtos apenas dos produto que saíram em pedidos
select avg(preco) from produto 

-- 6- listar dados do pedido, usuário e produtos apenas dos pedidos acima de 300 reais
select * from pediprodutos p
inner join pedido pe on p.pedidoid = pe.id
inner join produto on p.produtoid = produto.id
inner join usuario on pe.usuarioid = usuario.id
where pe.valortotal > 300

-- 7- mostrar o nome do usuário, cidade e estado de usuários inativos
select u.nome, c.nome, c.estado from usuario u inner join cidade c on c.id = u.cidadeid where u.ativo = false

-- 8- suba o preço do "Mouse Gamer" e do "Mousepad XXL" em 15%
update produto 
set preco = 172.50
where id = 1

update produto
set preco = 51.75
where id = 8

-- 9- mostrar quantidade total de pedidos por usuário
SELECT usuario.id, COUNT(pedido.id) as pedidostotais
FROM pedido
LEFT JOIN usuario ON usuario.id = pedido.usuarioid
GROUP BY usuario.id;

-- 10- mostrar valor total vendido por produto
select p.valortotal from pediprodutos p
inner join produto pro on p.produtoid = pro.id

-- 11- mostrar usuário que fizeram pedidos acima do valor médio
select u.id, u.nome, u.cpf, u.email, u.telefone, u.datacadastro, u.ativo from usuario u
inner join pedido p on p.usuarioid = u.id
where p.valortotal > (select avg(valortotal) from pedido)

-- 12- Mostrar produtos com preço acima da média dos produtos
select * from produto
where produto.preco > (select avg(preco) from produto)