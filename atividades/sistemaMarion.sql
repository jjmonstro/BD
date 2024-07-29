create database nossosistema

-- mudando a base de dados a ser usada
use nossosistema


drop table item_pedido;
drop table pedido;
drop table produto;
drop table vendedor;
drop table cliente;


create table cliente (
		cod_clie numeric(4) not null primary key, 
		nome_clie varchar(20) not null, 
		endereco varchar(30),
		cidade varchar(15), 
		cep char(8),
		uf char(2), 
		cnpj char(16), 
		ie char(12)
);


create table vendedor (
	cod_ven numeric(4) not null primary key,
	nome_ven varchar(20) not null, 
	salario_fixo numeric(12,2),
	comissao char(1)
);

create table produto (
	cod_prod numeric(4) not null primary key, 
	unidade varchar(3),
	descricao varchar(20), 
	val_unit numeric(10,2)
);

create table pedido (
	num_pedido numeric(4) not null primary key, 
	pr_entrega numeric(3) not null, 
	cod_clie numeric(4)  references cliente,
	cod_ven numeric(4) not null references vendedor
);

create table item_pedido (
	num_pedido numeric(4) not null references pedido, 
	cod_prod numeric(4) not null references produto, 
	quant numeric(10,2)
);

alter table vendedor add dt_adm DATE 
alter table vendedor add dt_demissao DATE  

update vendedor set dt_adm = getdate();
update vendedor set dt_demissao = getdate();
select * from vendedor

--Inserção dos dados do cliente
insert into cliente values(720,'Ana','Rua 17 n.19','Niteroi','24358310','RJ','12113231/0001-34','2134');
insert into cliente values(870,'Flavio','Av. Pres. Vargas, 10','Sao Paulo','22763931','SP','22534126/9387-9','4631');
insert into cliente values(110,'Jorge','Rua Caiapo, 13','Curitiba','30078500','PR','14512764/9834-9',null);
insert into cliente values(222,'Lucia','Rua Itabira, 123','Belo Horizonte','22124391','MG','283152123/9348-8','2985');
insert into cliente values(830,'Mauricio','Av. Paulista, 1236','Sao Paulo','3012683','SP','32816985/7465-6','9343');
insert into cliente values(130,'Edmar','Rua da Praia, s/n','Salvador','30079300','BA','23463284/234-9','7121');
insert into cliente values(410,'Rodolfo','Largo da Lapa, 27','Rio de Janeiro','30078900','RJ','12835128/2346-9','743');
insert into cliente values(20,'Beth','Av. Climerio, 45','Sao Paulo','25679300','SP','32485126/7326-8','9280');
insert into cliente values(157,'Paulo','Trav. Moraes, casa 3','Londrina',null,'PR','32848223/324-2','1923');
insert into cliente values(180,'Livio','Av. Beira Mar, 1256','Florianopolis','30077500','SC','12736571/2347-4','1111');
insert into cliente values(260,'Susana','Rua Lopes Mandes, 12','Niteroi','30046500','RJ','21763571/232-9','2530');
insert into cliente values(290,'Renato','Rua Meireles, 123','Sao Paulo','30225900','SP','13276571/1231-4','1820');
insert into cliente values(390,'Sebastiao','Rua da Igreja, 10','Uberaba','30438700','MG','32176547/213-3','9071');
insert into cliente values(234,'Jose','Quadra 3, Bl. 3, sl. 1003','Brasilia','22841650','DF','21763576/1232-3','2931');

-- select nome_coluna1, nome_coluna2,... from tabela
select * from cliente order by nome_clie;
select nome_clie, cnpj, endereco from cliente;

--trazer todos os clientes mas em ordem alfabética
-- order by ordena a minha seleção asc/desc um determino campo
-- select * from tabela order by nome_coluna [asc/desc]
select nome_clie, cidade from cliente order by cidade desc, nome_clie desc
select nome_clie, cidade from cliente order by cidade, nome_clie desc

select * from cliente
--Inserção dos dados do vendedor
insert into vendedor values(209,'José',1800,'C');
insert into vendedor values(111,'Carlos',2490,'A'); 
insert into vendedor values(11,'João',2780,'C'); 
insert into vendedor values(240,'Antônio',9500,'C'); 
insert into vendedor values(720,'Felipe',4600,'A'); 
insert into vendedor values(213,'Jonas',2300,'A'); 
insert into vendedor values(101,'João',2650,'C');  
insert into vendedor values(310,'Josias',870,'B');  
insert into vendedor values(250,'Maurício',2930,'B');  

select * from item_pedido
--Inserção dos dados do produto
insert into produto values (25,'KG','Queijo',0.97)
insert into produto values (31,'BAR','Chocolate',0.87)
insert into produto values (78,'L','Vinho',2.00)
insert into produto values (22,'M','Linho',0.11)
insert into produto values (30,'SAC','Acucar',0.30)
insert into produto values (53,'M','Linha',1.80)
insert into produto values (13,'G','Ouro',6.18)
insert into produto values (45,'M','Madeira',0.25)
insert into produto values (87,'M','Cano',1.97)
insert into produto values (77,'M','Papel',1.05)

--Inserção dos dados do pedido
insert into pedido values (121,20,410,209);
insert into pedido values (97,20,720,101); 
insert into pedido values (101,15,720,101); 
insert into pedido values (137,20,720,720); 
insert into pedido values (148,20,720,101); 
insert into pedido values (189,15,870,213); 
insert into pedido values (104,30,110,101); 
insert into pedido values (203,30,830,250); 
insert into pedido values (98,20,410,209); 
insert into pedido values (143,30,20,111); 
insert into pedido values (105,30,180,240); 
insert into pedido values (111,15,260,240); 
insert into pedido values (103,20,260,11); 
insert into pedido values (91,20,260,11); 
insert into pedido values (138,20,260,11); 
insert into pedido values (108,15,290,310); 
insert into pedido values (119,30,390,250); 
insert into pedido values (127,10,410,11); 

--Inserção dos dados do item pedido
insert into item_pedido values (121,25,10); 
insert into item_pedido values (121,31,35); 
insert into item_pedido values (97,77,20); 
insert into item_pedido values (101,31,9); 
insert into item_pedido values (101,78,18); 
insert into item_pedido values (101,13,5); 
insert into item_pedido values (98,77,5); 
insert into item_pedido values (148,45,8); 
insert into item_pedido values (148,31,7); 
insert into item_pedido values (148,77,3); 
insert into item_pedido values (148,25,10); 
insert into item_pedido values (148,78,30); 
insert into item_pedido values (104,53,32); 
insert into item_pedido values (203,31,6); 
insert into item_pedido values (189,78,45); 
insert into item_pedido values (143,31,20); 
insert into item_pedido values (143,78,10); 

select cod_clie, nome_clie from cliente where cod_clie between 200 and 301 order by cod_clie asc

select * from pedido where num_pedido <102 or num_pedido >139 order by num_pedido asc

select * from vendedor where comissao='A' or comissao='B' 

select * from produto where unidade!='L' and unidade!='M' and unidade!='G'

select nome_clie from cliente where nome_clie like 'R%'

select nome_clie from cliente where nome_clie like '%o'

select nome_clie from cliente where nome_clie like '%a%'

select nome_clie from cliente where nome_clie like '____'

select nome_clie from cliente where nome_clie like '_e%'

select nome_clie from cliente where nome_clie like '%i_'

select nome_clie from cliente where nome_clie like 'J%'

select nome_clie from cliente where nome_clie like '%o%'

select nome_clie from cliente where nome_clie like '%o%' and nome_clie like '%e%'

select nome_clie from cliente where nome_clie not like '%u%'

select nome_clie from cliente where nome_clie like '%a%' and nome_clie like '%e%'

select count(*) AS 'Quantidade' from vendedor

select count(*) AS 'Quantidade sem cep' from cliente where cep is null

select count(*) AS 'Quantidade' from cliente where cep is not null

select count(*) AS 'Quantidade' from produto where val_unit > 50

select SUM(salario_fixo) AS 'Soma' from vendedor 

select SUM(val_unit) AS 'Soma' from produto

select AVG(salario_fixo) AS 'Media' from vendedor

select MAX(salario_fixo) AS 'Maior', MIN(salario_fixo) AS 'Menor' from vendedor

update vendedor set dt_adm = dateadd(day,-560,dt_adm) where comissao = 'A'
select * from vendedor

update vendedor set dt_adm = dateadd(day,-860,dt_adm) where comissao = 'B'

update vendedor set dt_adm = dateadd(day,-1000,dt_adm) where comissao = 'C'

update vendedor set dt_adm = NULL where comissao = 'A'

