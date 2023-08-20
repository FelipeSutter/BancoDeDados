-- criação do database

create database TrabIndividual;

-- criação das tabelas
create table funcionario(
	func_id serial not null,
	func_nome varchar(45) not null,
	func_cpf varchar(45) not null,
	func_telefone int not null,
	func_data_nascimento date not null,
	primary key(func_id)
);

create table departamento(
	dep_id serial not null,
	dep_nome varchar(45) not null,
	dep_telefone int not null,
	func_id int not null,
	primary key(dep_id),
	foreign key (func_id) references funcionario(func_id)
);

-- mudei a foreign key para o departamento

alter table departamento drop column func_id;

alter table funcionario
add column dep_id int,
add foreign key (dep_id) references departamento (dep_id);

-- insert na tabela departamento

insert into departamento(dep_nome,dep_telefone)
values
	('Área Financeira','22349068'),
	('Suporte ao Cliente','90901234');

-- select para ver se os dados inseridos estão corretos

select * from departamento d order by d.dep_id asc;

-- percebi que o tipo int no telefone não deu certo, e mudei pra varchar

alter table departamento
	alter column dep_telefone type varchar(45);

-- atualizei os valores que já tinha colocado como int

update departamento
	set dep_telefone = '2234-9068'
	where dep_id = 1;

update departamento
	set dep_telefone = '9090-1234'
	where dep_id = 2;

-- continuação dos inserts da tabela departamento

insert into departamento(dep_nome, dep_telefone)
values
	('Departamento de Gráficos', '23456-7891'),
	('Departamento de Cartões', '4002-8922'),
	('Infraestutura Empresarial', '78120-9090');

-- mudando o nome do departamento 1 para Invest Já

update departamento
	set dep_nome = 'Invest Já'
	where dep_id = 1;
	
