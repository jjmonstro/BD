create database ATV_02_CDS;
use ATV_02_CDS;

create table Cds (
	Codigo numeric (3) constraint codigo_PK primary key,
	Nome varchar (50) constraint nome_NN not null,
	DataCompra date,
	ValorPago numeric(8,2) constraint valor_NN not null,
	LocalCompra varchar(20),
	Album char (1)
);



create table Musicas (
	CodigoCD numeric (3) foreign key
		references Cds(Codigo),
	Numero numeric (2) primary key,
	Nome varchar (50),
	Artista varchar (50),
	Tempo numeric (4)
);

insert into Cds (Codigo,Nome,DataCompra,ValorPago,LocalCompra,Album) values(1,'Rock Puro','1550-12-18',195689.74,'Rua trajano 216',1)
insert into Cds (Codigo,Nome,DataCompra,ValorPago,LocalCompra,Album) values (2, 'Astro World', '2022-02-19', 978564.76, 'Rua Ministro 165',1) 
insert into Cds (Codigo,Nome,DataCompra,ValorPago,LocalCompra,Album) values (3, 'Maquina do Tempo', '2021-10-22', 932931.32, 'Rua Augostinho 213',8)
insert into Cds (Codigo,Nome,DataCompra,ValorPago,LocalCompra,Album) values (4, 'Vapo', '2020-07-31', 324567.84, 'Rua Marcos 858',2) 
insert into Cds (Codigo,Nome,DataCompra,ValorPago,LocalCompra,Album) values (5, 'Sabo', '2052-03-12', 957263.72, 'Rua Freire 125',5) 

insert into Musicas (CodigoCD,Numero,Nome,Artista,Tempo) values (1, 23, 'fuck17fuck12', 'Brocasito', 0552)

update Cds set ValorPago = 999999.00 where Nome = 'Rock Puro'
delete from Cds where Codigo = 4

select * from Cds
select * from Musicas