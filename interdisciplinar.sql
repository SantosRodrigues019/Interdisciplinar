create database  bookTime
GO

use bookTime;
GO

CREATE TABLE usuario(
    id_usuario        INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    nome_usuar        VARCHAR(60) NOT NULL,
    senha_usuario	  NUMERIC(10) NOT NULL,
    email_usuario	  VARCHAR(60) NOT NULL,
    estado_usuar      VARCHAR(20) NOT NULL,   
    dta_nascimento	  DATE
);
GO

CREATE TABLE doador(
    id_doador            INT IDENTITY(5,5) PRIMARY KEY NOT NULL,
    nome_doador          VARCHAR(65) NOT NULL,
    email                VARCHAR(60) NOT NULL,
    estado_doador        VARCHAR(20) NOT NULL,
    dta_nascimento       DATE
);
GO

 CREATE TABLE livro (
    id_livro                        INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_doador                       INT  NOT NULL,
	nome_doador					    VARCHAR(60) NOT NULL,
    nome_livro                      VARCHAR(60) NOT NULL,
    editora_livro                   VARCHAR(10) NOT NULL,
    autor_livro                     VARCHAR(40) NOT NULL,
    genero_livro                    VARCHAR(10) NOT NULL,   
    constraint Nome_id_doador foreign key(id_doador) references doador(id_doador), 
 );
 GO

 CREATE TABLE estado (
     id_estado INT IDENTITY(10,10) PRIMARY KEY NOT NULL,
     nome_estado VARCHAR(10) NOT NULL,
     longitude_estado VARCHAR(10) NOT NULL,
     latitude_estado VARCHAR (10) NOT NULL,
 );
GO

CREATE TABLE login_usuario (
idloginusuario	int identity (1,1) primary key  not null,
email_usuario				    VARCHAR(40) NOT NULL,
senha_usuario				    VARCHAR(10) NOT NULL,
);
GO

 insert into usuario(nome_usuar,senha_usuario,email_usuario,estado_usuar,dta_nascimento)
 values ('Roberta Silva',1234567894,'roberta_09.silva@gmail.com','Bahia','2000-05-24'),
('Fabiana Lie Shimada',1472583691,'fabiana_lie@hotmail.com','Sao Paulo','1999-04-02'),
('Diego Luis',7894561236,'diego_wolf@yahoo.com','Acre','2001-01-19'),
('Valquiria Santos',7531598264,'santos_valquiria@outlook.com','Espirito Santos','1973-03-13');
 GO

 insert into doador(nome_doador,email,estado_doador,dta_nascimento)
 values('Diego Luis','diego_wolf@yahoo.com','Acre','2001-01-19'),
('Valeria Rodrigues','valeria_bella@hotmail.com','Rio de Janeiro','25-02-1997'),
('Fabiana Lie Shimada','fabiana_lie@hotmail.com','Sao Paulo','1999-04-02'),
('Rafael Fernandes','rafael_cfc19@hotmail.com','Parana','2002-05-14');
 GO

 insert into livro(nome_livro,editora_livro,autor_livro,genero_livro,nome_doador)
 values('O Cortico','B.L.Garnier','Aluisio Azevedo','Literatura do naturalismo','Diego Luis'),
 ('Iracema','L&PM Pocket','Jose de Alencar','Romance de amor','Rafael Fernandes'),
 ('A cartomante','Zahar','Machado de Assis','Romance grafico','Fabiana Lie'),
 ('harry potter e a camara secreta','Rocco','J. K. Rowling','Literatura fantastica','Diego Luis');
 GO


 insert into login_usuario(senha_usuario,email_usuario)
 values('20195021','roberta_09.silva@gmail.com'),
 ('bella12578','valeria_bella@hotmail.com'),
 ('25252147','diego_wolf@yahoo.com'),
 ('rafa201599','rafael_cfc19@hotmail.com');
 go

 insert into estado(nome_estado,longitude_estado,latitude_estado)
 values('Bahia',12973,385023),
 ('Sao Paulo',466333,23550),
 ('Acre',678249,99754),
 ('Parana',553493,113391);
 go

 select * from usuario;
 GO
 select * from doador;
 GO
 select * from livro;
 GO
select * from login_usuario;
 GO
 select * from estado;
 GO



ALTER TABLE  doador 
add livro_doado varchar(60) not null;
GO


ALTER TABLE  livro 
add edicao_livro numeric(5) not null;
GO

SELECT nome_livro FROM livro WHERE autor_livro LIKE 'H%'

SELECT nome_doador FROM doador WHERE id_doador LIKE '%a'

select * from livro a join doador b ON a.nome_livro = b.nome_doador;

select * from estado a join usuario b ON a.id_estado = b.id_usuario;

select * from doador a join estado b ON a.id_doador = b.id_estado;

/*SUB-QUERY*/


/*FUNCOES DE LINHAS */


/*FUNCOES DE GRUPO */

create view dados_livro 
as select f.id_livro 'Id', c.nome_doador ' Nome Doado',  c.nome_doador 'Nome doador'
from livro f inner join doador c on f.id_doador = c.id_doador;

select * from dados_livro;

update livro 
set nome_livro = 'Senhora'
where id_livro = 2;

select * from livro;

drop table livro
GO

drop table usuario
GO

drop table doador
GO

drop table login_usuario
GO

drop table estado
GO

drop database bookTime
go