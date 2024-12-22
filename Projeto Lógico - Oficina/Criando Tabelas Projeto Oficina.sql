-- criação de banco de dados par o cenário de Oficina 
create database oficina;

show databases;
use oficina;
show tables;

select * from os;
-- criar as tabela OS
create table os(
	idOs int auto_increment primary key,
    veiculo_idVeiculo int,
    dataemissao date,
    valor decimal(10,2),
    statuss varchar(45),
    dataentrega date,
    dataconclusao date,
    constraint fk_os_veiculo foreign key (veiculo_idVeiculo) references veiculo(idVeiculo)
    );
    
    alter table os auto_increment=1;
    
    select * from veiculo;
-- criar as tabela Veiculo
create table veiculo(
	idVeiculo int auto_increment primary key,
    cliente_idCliente int,
    modelo varchar(45),
    Ano varchar(45),
    placa varchar(10),
    constraint fk_veiculo_cliente foreign key (cliente_idCliente) references cliente(idCliente)
    );    
    
    alter table veiculo auto_increment=1;
    
       select * from cliente;
-- criar as tabela Cliente
create table cliente(
	idCliente int auto_increment primary key,
    nome varchar(255),
    endereco varchar(255),
    telefone varchar(20),
    autorizaservico varchar(60));    
    
    alter table cliente auto_increment=1;
    
    select * from mecanicoos;
        -- criar tabela mecanicoos
CREATE TABLE mecanicoos (
    os_idOS INT,
    os_Veiculo_idVeiculo INT,
    mecanico_idMecanico int,
    PRIMARY KEY (os_idOS, os_Veiculo_idVeiculo, mecanico_idMecanico),
    CONSTRAINT fk_os_idOS_mecanicoos FOREIGN KEY (os_idOS) REFERENCES os(idOs),
	CONSTRAINT fk_os_Veiculo_idVeiculo_mecanicoos FOREIGN KEY (os_Veiculo_idVeiculo) REFERENCES os(veiculo_idVeiculo),
    CONSTRAINT fk_mecanico_idMecanico_mecanicoos FOREIGN KEY (mecanico_idMecanico) REFERENCES mecanico(idMecanico)
);

select * from mecanico;
   -- criar tabela mecanico
CREATE TABLE mecanico (
    idMecanico INT auto_increment primary key,
    nome varchar(255),
    endereco varchar(255),
    especialidade varchar(255),
    equipe varchar(255)
   );
     alter table mecanico auto_increment=1;
   
   select * from pecaos;
      -- criar tabela pecaos
CREATE TABLE pecaos (
    os_idOS int,
    os_Veiculo_idVeiculo int,
    peca_idPeca int,
	PRIMARY KEY (os_idOS, os_Veiculo_idVeiculo, peca_idPeca),
    CONSTRAINT fk_os_idOS FOREIGN KEY (os_idOS) REFERENCES os(idOs),
	CONSTRAINT fk_os_Veiculo_idVeiculo FOREIGN KEY (os_Veiculo_idVeiculo) REFERENCES os(veiculo_idVeiculo),
    CONSTRAINT fk_peca_idPeca FOREIGN KEY (peca_idPeca) REFERENCES peca(idPeca)
   );
   
   
 select * from peca;
      -- criar tabela peca
CREATE TABLE peca (
    idPeca int auto_increment primary key,
    nome varchar(255),
    descricao longtext,
    valorpeca float
);
 alter table peca auto_increment=1;

select * from servico;
      -- criar tabela servico
CREATE TABLE servico (
    idServico int auto_increment primary key,
    nome varchar(255),
    descricao longtext,
    valorservico varchar(45)
);
alter table servico auto_increment=1;

select * from servicoos;
      -- criar tabela servicoos
CREATE TABLE servicoos(
    os_idOs int,
    os_Veiculo_idVeiculo int,
    servico_idServico int,
    tabela_idMaodeobra int,
    PRIMARY KEY (os_idOS, os_Veiculo_idVeiculo, servico_idServico,tabela_idMaodeobra),
    CONSTRAINT fk_os_idOS_servicoos FOREIGN KEY (os_idOs) REFERENCES os(idOs),
	CONSTRAINT fk_os_Veiculo_idVeiculo_servicoos FOREIGN KEY (os_Veiculo_idVeiculo) REFERENCES os(veiculo_idVeiculo),
    CONSTRAINT fk_servico_idServico_servicoos FOREIGN KEY (servico_idServico) REFERENCES servico(idServico),
    CONSTRAINT fk_tabelamao_idMaodeobra_servicoos FOREIGN KEY (tabela_idMaodeobra) REFERENCES tabelamao(idMao)
   );

select * from tabelamao;
      -- criar tabela tabelamao
CREATE TABLE tabelamao(
    idMao int auto_increment primary key,
    descricao longtext,
    valormaodeobra varchar(45)    
   );
   alter table servico auto_increment=1;




    
    