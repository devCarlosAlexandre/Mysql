use teste;
/* criando tabela de clientes e seus campos ---------------------------------------------------------------------- */
create table clientes 
(
id int primary key auto_increment,
nome varchar(50) not null,
cpf char(11) not null,
data_nascimento date not null,
email varchar(70) not null,
ativo bit not null
);

create table categorias
(
id int primary key auto_increment,
nome varchar(50) not null
);

create table produtos
(
id int primary key auto_increment,
descricao varchar(100) not null,
qtd_estoque float not null,
preco float not null,
categoria_id int not null,
foreign key(categoria_id) references categorias (id)
);

create table vendas
(
id int primary key auto_increment,
data_venda date not null,
cliente_id int not null,
total_venda float not null,
foreign key (cliente_id) references clientes (id)
);

create  table itens_vendas
(
id_produto int not null,
id_venda int not null,
valor_produto float not null,
desconto float not null,
foreign key (id_produto) references produtos (id),
foreign key (id_venda) references vendas (id),
primary key  (id_produto, id_venda)
);

/* inserindo dados da tabela ------------------------------------------------------------------------------------------ */
insert into clientes (nome, cpf, email, data_nascimento, ativo) values 
('Ávila Lorena Costa', '02398745625', 'AvLore@gmail.com', '2004-06-18', true );

insert into categorias (nome) values ('frios');
insert into categorias (nome) values ('igiene');
insert into categorias (nome) values ('igiene');

insert into produtos (descricao, preco, qtd_estoque, categoria_id)
values ('Queijo Parmesão', 1.99, 250, 1);
insert into produtos (descricao, preco, qtd_estoque, categoria_id)
values ('Presunto Parmesão', 5.79, 123, 1);
insert into produtos (descricao, preco, qtd_estoque, categoria_id)
values ('Papel Igienico', 5.00, 10, 2);
insert into produtos (descricao, preco, qtd_estoque, categoria_id)
values ('Sabonete', 1.00, 50, 2);
insert into produtos (descricao, preco, qtd_estoque, categoria_id)
values ('Coca Cola', 12.00, 15, 3);
insert into produtos (descricao, preco, qtd_estoque, categoria_id)
values ('Skol', 12.00, 15, 3);
insert into produtos (descricao, preco, qtd_estoque, categoria_id)
values ('Guarana Jesus', 12.00, 15, 3);
select * from produtos;

insert into vendas (data_venda, cliente_id, total_venda)
values('2023-03-08',1,225);

insert into itens_vendas(id_venda, id_produto, valor_produto, desconto)
values(1, 1, 10.20, 5.0);
insert into itens_vendas(id_venda, id_produto, valor_produto, desconto)
values(1, 4, 12.20, 1.20);

/* buscando dado na tabela -----------------------------------------------------------------------------------------------*/
select * from clientes;
select * from produtos;
select * from produtos order by preco;
select * from produtos order by qtd_estoque desc;	
select * from vendas;
select * from itens_vendas;
select id,preco,descricao from  produtos;
/* inerjoin */
select p.id, p.descricao, p.preco, c.nome 'categoria'
from produtos p	inner join categorias c
on c.id = p.categoria_id
where p.preco < 10
;	

select p.id 'codigo', p.descricao, (p.preco * p.qtd_estoque)'total', c.nome
from produtos p inner join categorias c
on p.categoria_id = c.id;

select id_produto, (valor_produto - (valor_produto*desconto/100))
from itens_vendas;

select count(p.id) 'quantidade', c.nome from produtos p inner join categorias c 
on p.categoria_id = c.id
group by p.categoria_id
;

/* atualizando dados da tabela ---------------------------------------------------------------------------------------- */              
update clientes set email = "carlos@hootmail.com" 
where id = 1;
update produtos set qtd_estoque = 100  where id = 5;
select * from produtos;


/* deletando dados da tabela ------------------------------------------------------------------------------------------  */
delete from clientes where id= 2;

/* deletando a tabela --------------------------------------------------------------------------------------------------*/
drop table categorias;

