create table Pedido (
    id serial primary key,
    NomeCliente varchar(100) not null,
    DataPedido timestamp default current_timestamp not null,
    ValorTotal decimal(10, 2) not null,
    Status varchar(20) default 'Pendente' not null,
    FormaPagamento varchar(30) not null,
    Observacao varchar(200)
)

INSERT INTO Pedido (NomeCliente, DataPedido, ValorTotal, Status, FormaPagamento, Observacao)
VALUES
('João Silva', '2026-05-01 10:15:00', 150.90, 'Pendente', 'Cartão de Crédito', 'Entrega rápida'),
('Maria Oliveira', '2026-05-02 14:30:00', 89.50, 'Pago', 'PIX', 'Cliente VIP'),
('Carlos Souza', '2026-05-03 09:45:00', 320.00, 'Enviado', 'Boleto', 'Sem observações'),
('Ana Pereira', '2026-05-03 16:20:00', 45.75, 'Cancelado', 'Dinheiro', 'Pedido cancelado pelo cliente'),
('Fernanda Lima', '2026-05-04 11:10:00', 560.30, 'Pago', 'Cartão de Débito', 'Entrega agendada'),
('Ricardo Alves', '2026-05-04 18:00:00', 210.99, 'Pendente', 'PIX', 'Retirada no local'),
('Patrícia Gomes', '2026-05-05 08:25:00', 99.90, 'Enviado', 'Cartão de Crédito', 'Embalagem para presente'),
('Lucas Rocha', '2026-05-05 13:40:00', 780.00, 'Pago', 'Boleto', 'Entrega expressa'),
('Juliana Costa', '2026-05-06 15:55:00', 65.49, 'Pendente', 'Dinheiro', 'Troco para 100'),
('Eduardo Martins', '2026-05-06 19:30:00', 430.15, 'Enviado', 'PIX', 'Cliente recorrente'),
('Camila Ferreira', '2026-05-07 10:05:00', 250.00, 'Pago', 'Cartão de Crédito', 'Pedido confirmado'),
('Bruno Ribeiro', '2026-05-07 17:45:00', 120.80, 'Cancelado', 'Cartão de Débito', 'Pagamento recusado'),
('Aline Mendes', '2026-05-08 12:00:00', 999.99, 'Pago', 'PIX', 'Entrega premium'),
('Thiago Carvalho', '2026-05-08 14:50:00', 310.70, 'Enviado', 'Boleto', 'Sem contato na entrega'),
('Beatriz Santos', '2026-05-09 09:15:00', 74.20, 'Pendente', 'Dinheiro', 'Cliente pediu confirmação por telefone');

select * from Pedido
order by ValorTotal

update Pedido
set ValorTotal = 1000
where id = 13

delete from Pedido
where ValorTotal < 100

select NomeCliente, DataPedido, ValorTotal from Pedido
where DataPedido >= '2025-01-01' and DataPedido <= '2025-02-01'
order by ValorTotal

select * from pedido 
where FormaPagamento = 'PIX'
order by DataPedido desc

drop table Pedido

select * from Pedido
where Observacao ilike '%urgente%'

select * from pedido 
order by ValorTotal desc
limit 2

-- máximo número de caracteres
-- create table teste (
-- |   nome varchar(10.485.760)
-- )