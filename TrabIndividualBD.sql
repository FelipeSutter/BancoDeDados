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

-- mudando o tipo do telefone para varchar

alter table funcionario 
	alter column func_telefone type varchar(45);

-- início dos inserts na tabela funcionário
	
insert into funcionario(dep_id, func_nome, func_cpf, func_telefone, func_data_nascimento)
values
	('1','Robert Wallow', '89014356723','90081-2314', '09/06/1908'),
	('1','Daniel Cars', '908712356766', '89021-8081', '10/10/1010'),
	('2','Aaron Civic', '83398310036', '33540-9617', '03/05/2010'),
	('2','Kilik da Silva','17540291087', '82132-3828', '11/01/2000'),
	('3','Felipe Rodrigues','07380855026','23646-4317', '01/12/1980'),
	('4','Pâmela Oliveira dos Santos','56939181067','73473-5645','30/06/2003'),
	('5','Vitória Nielman','80268251010','43331-3155','08/11/1990'),
	('5','Grace Millstone','35062313082','52988-0823','15/02/2007');

-- mostra os departamentos em ordem crescente de nome.

select
	*	
from departamento d
order by d.dep_tx_nome asc;

-- mostra todos os nomes dos funcionários e os respectivos departamentos.

select
	f.func_tx_nome as "Nome do Funcionário", dep_int_id as "Número do Departamento" 
from
	funcionario f
where dep_int_id > 0;

-- inner join que mostra qual o nome do funcionário que trabalha no departamento x e o nome do departamento.

select
	f.func_tx_nome as "Nome do Funcionário", d.dep_tx_nome as "Nome do Departamento"
from
	funcionario f
inner join departamento d on
	f.dep_int_id = d.dep_cd_id 
where d.dep_tx_nome = :dep;

-- mudar o tipo do dado para NOT NULL

ALTER TABLE funcionario 
ALTER COLUMN dep_id SET NOT NULL;

-- mudança dos nomes para incluir mnemônicos

alter table departamento
--rename column dep_id to dep_cd_id,
rename column dep_tx_id to dep_tx_nome;
--rename column dep_telefone to dep_tx_telefone;

alter table funcionario 
rename column func_id to func_cd_id;
rename column func_nome to func_tx_nome;
rename column func_cpf to func_tx_cpf;
rename column func_telefone to func_tx_telefone;
rename column func_data_nascimento to func_dt_data_nascimento;
rename column dep_id to dep_int_id;

-- atualizei o id do departamento

update funcionario 
	set dep_id = 1
	where func_id = 1;

update funcionario 
	set dep_id = 1
	where func_id = 2;

update funcionario 
	set dep_id = 2
	where func_id = 3;

update funcionario 
	set dep_id = 2
	where func_id = 4;

update funcionario 
	set dep_id = 3
	where func_id = 5;

update funcionario 
	set dep_id = 4
	where func_id = 6;

update funcionario 
	set dep_id = 5
	where func_id = 7;

update funcionario 
	set dep_id = 5
	where func_id = 8;
