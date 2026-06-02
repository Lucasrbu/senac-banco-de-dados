create table arenas (
	id serial primary key,
	nome varchar(100) not null,
	CapacidadeDePublico int not null,
	modalidadeid int not null,
	foreign key (modalidadeid) references modalidade(id)
)

create table modalidade (
	id serial primary key,
	nome varchar(100) not null
)

insert into modalidade(nome) values
('FPS'),
('MOBA'),
('Battle Royale'),
('Fighting Games');

create table equipes (
	id serial primary key,
	nome varchar(100),
	jogadoresid int not null,
	foreign key (jogadoresid) references Jogadores(id)
)

create table Jogadores (
	id serial primary key,
	nome varchar(100) not null,
	nickname varchar(100) not null,
	dataNascimento date not null,
	Salário decimal(10, 2) not null
	equipePertencenteId int not null,
	foreign key (equipePertencenteId) references equipes(id)
)

create table partidas (
	id serial primary key,
	horario timestamp not null,
	arenaid int not null,
	equipeid int not null,
	patrocinadoresid int not null,
	streamersid int not null,
	foreign key (equipeid) references equipes(id),
	foreign key (arenaid) references arenas(id),
	foreign key (patrocinadoresid) references patrocinadores(id),
	foreign key (streamersid) references streamesConvidados(id)
)

create table patrocinadores(
	id serial primary key,
	NomeEmpresa varchar(100) not null,
	Categoria varchar(100) not null,
	ValorInvestido decimal(10, 2) not null
)

create table TipoIngressos (
	id serial primary key,
	tipoAcesso varchar(20) not null,
	preco decimal(10, 2) not null
)

insert into TipoIngressos(tipoacesso, preco) values 
('backstage', 140.00),
('diário', 40.00),
('premium', 75.00);

select * from Tipoingressos

create table ingressos (
	id serial primary key,
	Visitantes int not null,
	tipoingressoid int not null,
	partidaid int not null,
	foreign key (tipoingressoid) references tipoIngressos(id),
	foreign key (partidaid) references partidas(id)
)

create table lotacao (
	id serial primary key,
	partidaid int not null,
	publicototal int not null,
	foreign key (partidaid) references partidas(id)
)

create table plataforma (
	 id serial primary key,
	 nome varchar(100) not null
)

insert into plataforma(nome) values
('Youtube'),
('Twitch'),
('Kick');

create table streamersConvidados (
	id serial primary key,
	nome varchar(100) not null,
	plataformaid int not null,
	seguidores int not null,
	foreign key (plataformaid) references plataforma(id) 
)