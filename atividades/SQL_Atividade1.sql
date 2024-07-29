create database escola;
use escola;

create table tbl_instrutor(
	cod_instrutor numeric(3) not null primary key,
	nome_instrutor varchar(30) not null,
	fone_instrutor varchar(15)
);

create table cliente(
	cpf_clie char(11) not null primary key,
	dt_nasc date not null,
	nm_clie varchar(30) not null,
	end_clie varchar(50),
	cep_clie char(8)
);

create table produto(
	ds_prod varchar(50) not null,
	cd_prod numeric(6) primary key,
	preco numeric(12,2) not null,
	qtde numeric(10,2) not null
);