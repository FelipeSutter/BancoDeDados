create database TrabIndividual;

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

alter table departamento drop column func_id;

alter table funcionario
add column dep_id int,
add foreign key (dep_id) references departamento (dep_id);
