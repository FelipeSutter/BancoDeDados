/*create table senha(
	sen_id serial primary key,
	sen_numero integer,
	sen_data timestamp,
	fk_pac_id integer,
	foreign key (fk_pac_id) references paciente(pac_id)
);*/

alter table paciente
	--add column pac_cpf integer;
	add column pac_dataNasc date;