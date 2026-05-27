CREATE TABLE Usuario (
    Id SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Telefone VARCHAR(20),
    DataCadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Ativo BOOLEAN DEFAULT TRUE
);

create table Pedido (
    id serial primary key,
    UsuarioId int not null,
    DataPedido timestamp default current_timestamp not null,
    ValorTotal decimal(10, 2) not null,
    StatusId int not null default 1,
    FormaPagamentoId int not null, 
    Observacao varchar(200) null,
    foreign key (UsuarioId) references Usuario(Id),
    foreign key (FormaPagamentoId) references FormaPagamento(Id),
    foreign key (StatusId) references Status(Id)
)

create table FormaPagamento (
	Id int primary key,
	Nome varchar(30)
)

create table Status (
	Id int primary key,
	Nome varchar(30) not null
)

INSERT INTO Usuario (Nome, CPF, Email, Telefone, Ativo)
VALUES
('João Silva', '12345678901', 'joao.silva@gmail.com', '(11) 99876-1234', TRUE),
('Maria Oliveira', '23456789012', 'maria.oliveira@yahoo.com', '(21) 99765-4321', TRUE),
('Carlos Souza', '34567890123', 'carlos.souza@hotmail.com', '(31) 99654-3210', FALSE),
('Ana Pereira', '45678901234', 'ana.pereira@gmail.com', '(41) 99543-2109', TRUE),
('Fernanda Lima', '56789012345', 'fernanda.lima@outlook.com', '(51) 99432-1098', FALSE),
('Ricardo Gomes', '67890123456', 'ricardo.gomes@gmail.com', '(61) 99321-0987', TRUE),
('Patricia Alves', '78901234567', 'patricia.alves@yahoo.com', '(71) 99210-9876', TRUE),
('Lucas Martins', '89012345678', 'lucas.martins@hotmail.com', '(81) 99109-8765', FALSE),
('Juliana Rocha', '90123456789', 'juliana.rocha@gmail.com', '(91) 99098-7654', TRUE),
('Bruno Carvalho', '01234567890', 'bruno.carvalho@outlook.com', '(92) 98987-6543', TRUE);

INSERT INTO Pedido (UsuarioId, ValorTotal, StatusId, FormaPagamentoId, Observacao)
VALUES
(1, 250.75, 1, 3, 'Entrega expressa'),
(2, 89.90, 3, 1, 'Cliente pediu embalagem presente'),
(3, 560.00, 2, 5, NULL),
(4, 120.50, 2, 4, 'Pagamento não aprovado'),
(5, 999.99, 1, 2, 'Entrega agendada'),
(6, 45.00, 3, 4, NULL),
(7, 310.20, 1, 5, 'Entregar após 18h'),
(8, 780.40, 3, 1, NULL),
(9, 150.00, 2, 3, 'Primeira compra do cliente'),
(10, 67.89, 4, 2, NULL);

-- essas letras u e p são apenas elementos para representar as tabelas, eles poderiam ser trocados por praticamente qualquer coisa.
select * from Usuario u
inner join Pedido P
on p.UsuarioId = u.Id

select p.id, u.nome, p.DataPedido, p.ValorTotal from Pedido p
inner join Usuario u
on p.UsuarioId = u.id

select p.Id as pedidoid, p.UsuarioId, u.Nome as NomeUsuario, p.datapedido,
fp.Nome as FormaPagamento, s.Nome as Status, p.valortotal from pedido p
inner join Usuario u on p.UsuarioId = u.Id inner join Status s on p.StatusId = s.Id
inner join formapagamento fp on p.FormaPagamentoId = fp.Id

INSERT INTO Pedido (UsuarioId, ValorTotal, Status, FormaPagamento, Observacao)
values
(6, 120.99, 'pago', 'PIX', 'entrega normal')

INSERT INTO Pedido (UsuarioId, ValorTotal, Status, FormaPagamento, Observacao)
values
(9, 200.99, 'pendente', 'PIX', null)

INSERT INTO Pedido (UsuarioId, ValorTotal, Status, FormaPagamento, Observacao)
values
(5, 200.99, 'pendente', 'PIX', 'Força Magalu 2')

INSERT INTO Pedido (UsuarioId, ValorTotal, Status, FormaPagamento, Observacao)
values
(7, 123.99, 'pago', 'PIX', null)

INSERT INTO Pedido (UsuarioId, ValorTotal, Status, FormaPagamento, Observacao)
values
(3, 170.99, 'pago', 'PIX', 'Força Magalu 4')

select * check

insert into FormaPagamento (Id, Nome) values
(1, 'Cartão de Crédito'),
(2, 'Cartão de Débito'),
(3, 'PIX'),
(4, 'Boleto'),
(5, 'Dinheiro');

select * from FormaPagamento

select * from pedido

insert into Status (Id, Nome) values 
(1, 'pendente'),
(2, 'pago'),
(3, 'enviado'),
(4, 'cancelado')

select count(*) as TotalUsuarios
from Usuario
where ativo = true

select max(ValorTotal) from Pedido

select min(ValorTotal) from Pedido

select avg(ValorTotal) from Pedido
where Usuarioid = 1

select avg(ValorTotal) from Pedido p inner join Usuario u on p.UsusarioId = u.id where u.ativo = true

select sum(ValorTotal) as SomaValorTotalPedidos from Pedido where FormaPagamentoId = 3

select sum(ValorTotal) from Pedido p inner join FormaPagamento f on p.formapagemntoid = f.id where f.nome ilike = '%Pix%'

select nome, email from Usuario where ativo = true

select id, DataPedido, ValorTotal from Pedido  where ValorTotal > 500

select count(*) from Usuario where EMAIL like '%gmail.com%'

select u.Nome, p.DataPedido, s.nome as status from Pedido p
inner join Usuario u on u.id = p.UsuarioId inner join Status s on p.StatusId = s.Id
where p.statusid = 2

select u.Nome as NomeUsuario, p.ValorTotal, fp.Nome as FormaPagamento from pedido p
inner join Usuario u on p.UsuarioId = u.Id inner join formapagamento fp on p.FormaPagamentoId = fp.Id
where fp.Nome ilike '%Cartão%'

select u.nome, p.DataPedido, p.ValorTotal from pedido p
inner join Usuario u on p.UsuarioId = u.Id
where p.ValorTotal > 1000

select u.nome from Pedido p
inner join Usuario u on p.UsuarioId = u.Id
where u.ativo = true

select u.nome, s.nome, p.Observacao from Pedido p
inner join Usuario u on p.UsuarioId = u.Id inner join Status s on p.StatusId = s.id 
where p.Observacao is not null

update Usuario
set telefone = '(20) 88543-2100', Email = 'maria.oliveira@gmail.com'
where id = 2