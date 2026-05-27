create table Produtos (
	Id serial primary key,
	Nome varchar(100) not null,
	Preco decimal(10, 2) not null,
	Estoque int default 0
)

insert into Produtos (Nome, Preco, Estoque)
values ('cola', 4.50, 10)

select *
from Produtos
order by Preco

update Produtos
set Preco = 0.80
where id = 3

delete from produtos 
where id = 2