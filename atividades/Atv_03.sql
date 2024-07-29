create database ATV10
USE ATV10

create table EMPR (
	matr char (6) constraint matr_PKNN primary key not null,
	nome varchar (12) constraint nome_NN not null,
	sobrenome varchar (15) constraint sobrenome_NN not null,
	dept char (3),
	fone char (14),
	dtadmin date,
	cargo char (10),
	exprofi numeric (2),
	sexo char (1),
	datanasc date,
	salario numeric (11,2),
	bonus numeric (11,2),
	comis numeric (11,2)
);

create table DEPT (
	dcodigo char (3) constraint dcodigo_PKNN primary key not null,
	dnome varchar (36) not null,
	gerente char (6),
	dsuper char (3)
);

create table PROJETO(
	pcodigo char (6) constraint pcodigo_PKNN primary key not null,
	pnome varchar (24) constraint pnome_NN not null,
	dcodigo char (3) constraint dcodigo_NN not null,
	resp char (6) constraint resp_NN not null,
	equipe numeric (5),
	dataini date,
	datafim date,
	psuper char (6)
);

sp_help EMPR;

alter table EMPR ADD CONSTRAINT EMPR_DEPTFK FOREIGN KEY (dept) references DEPT(dcodigo);
alter table DEPT ADD CONSTRAINT GERENTE_FK FOREIGN KEY (gerente) references EMPR(matr);
