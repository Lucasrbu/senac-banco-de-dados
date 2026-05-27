create table Funcionario (
	Id serial primary key,
	Nome varchar(100) not null,
	Cargo varchar(90) not null,
	Salario decimal(10, 2) not null,
	DataAdmissao date not null
)

insert into Funcionario
(Nome, Cargo, Salario, DataAdmissao)
values
('Jonas', 'Bombeiro Militar', 6500, '2015-07-26')

insert into Funcionario
(Nome, Cargo, Salario, DataAdmissao)
values
('Matheus', 'Desenvolvedor', 4000, '2025-02-13')

insert into Funcionario
(Nome, Cargo, Salario, DataAdmissao)
values
('Lucas', 'Desempregado', 0, '2009-10-17')

select * from Funcionario where Salario > 3000

select * from Funcionario
where DataAdmissao between '2025-01-01' and '2025-12-31'

select * from Funcionario
where Cargo = 'Desenvolvedor'

update Funcionario
set Cargo = 'Gerente'
where id = 1

delete from Funcionario
where id = 3