-- inserção dos dados nas tabelas - Projeto Oficina 
show databases;
use oficina;


-- show tables;
-- select * from cliente;
-- persistindo os dados na tabela cliente
INSERT INTO cliente (nome, endereco, telefone, autorizaservico)
VALUES
    ('Maria','rua silva de prata 29, Carangola - Cidade das Flores','11999999999','Autorizado'),
	('Ronaldo','rua prata 39, Carangola - Cidade das Flores','11999999987','Autorizado'),
	('Clara','rua Branco 50, Centro - Cidade Macau','11999999978','Autorizado');
    
--    select * from veiculo;
-- persistindo os dados na tabela veiculo
INSERT INTO veiculo (cliente_idCliente, modelo, Ano, placa)
VALUES
    (1,'Corsa','2001','AAA-9999'),
    (2,'Gol','2010','AAA-9980'),
    (3,'Astra','2005','AAA-9970');
    
   --   select * from os;
   --   desc os;
-- persistindo os dados na tabela os
INSERT INTO os (veiculo_idVeiculo, dataemissao, valor, statuss, dataentrega, dataconclusao)
VALUES
    (1,'2024-12-20',550.00,'Concluido','2025-01-05','2025-01-03'),
	(2,'2024-12-18',700.00,'Concluido','2024-12-20','2024-12-19'),
	(3,'2024-12-10',200.00,'Concluido','2024-12-20','2024-12-18');
    
   --  select * from peca;
   --  desc peca;
-- persistindo os dados na tabela peca
INSERT INTO peca (nome, descricao, valorpeca)
VALUES
    ('Motor','Motor com 100 cilindradas',5000.00),
    ('Correia dentada','Correia Dentada para motores de 8V',300.00),
    ('filtro de combustivel','Filtro de Combustivel Flex',20.00);
    
   --  select * from pecaos;
 --   desc pecaos;
-- persistindo os dados na tabela pecaos
INSERT INTO pecaos (os_idOS, os_Veiculo_idVeiculo, peca_idPeca)
VALUES
    (1,1,1),
    (2,2,2),
    (3,3,3);
    
   --   select * from mecanicoos;
  --  desc mecanicoos;
-- persistindo os dados na tabela mecanicoos
INSERT INTO mecanicoos (os_idOS, os_Veiculo_idVeiculo, mecanico_idMecanico)
VALUES
    (1,1,1),
    (2,2,2),
	(3,3,3);
    
  --   select * from mecanico;
   -- desc mecanico;
-- persistindo os dados na tabela mecanico
INSERT INTO mecanico (nome, endereco, especialidade,equipe)
VALUES
    ('Ronaldo Silva','Rua das Monções, 100, São Paulo -SP ','Mecânica Geral','Chefe'),
    ('isabela Andrade','Rua Azul, 500, São Paulo -SP ','Mecânica Geral','Chefe'),
    ('André de Azevedo','Av. Nações unidas, 1000, São Paulo -SP ','Eletrônica Automotiva','Eletricista');
    
 --    select * from servico;
--   desc servico;
-- persistindo os dados na tabela servico
INSERT INTO servico (nome, descricao, valorservico)
VALUES
    ('Retífica de Motor','Foi realizado a retífica no motor','1000.00'),
     ('Bomba de Combustível','Foi realizado a troca da Bomba de Combustível','500.00'),
      ('Correia Dentada','Foi realizado a troca da Correia Dentada','300.00');
      
      
  --   select * from servicoos;
--   desc servicoos;
-- persistindo os dados na tabela servicoos
INSERT INTO servicoos (os_idOs, os_Veiculo_idVeiculo, servico_idServico,tabela_idMaodeobra)
VALUES
 (1,1,1,1),
 (2,2,2,2),
 (3,3,3,3);
 
 --     select * from tabelamao;
 -- desc tabelamao;
-- persistindo os dados na tabela tabelamao
INSERT INTO tabelamao (descricao, valormaodeobra)
VALUES
('Mão de obra para retífica do motor', '500.00'),
('Mão de obra para Bomba de Combustível', '250.00'),
('Mão de obra para Correia Dentada', '150.00');
 
 select * from mecanico;
 -- Query     
-- Recupera o número de clientes
select count(*) from cliente;
 
 -- Recupera o nome, especialidade e equipe dos funcionários da mecânica   
    select concat(nome, '- Esp: ', especialidade, '- Equipe: ' , equipe) as Funcionário_Especialidade_Equipe from mecanico;
  
    select * from cliente;
    select * from veiculo;
    select * from os;
-- Recupera os dados dos clientes onde o serviço foi autorizado, nesse caso todos, pois todos os dados persistidos no BD estão como autorizados.
select idCliente, concat(nome, '| ', endereco, '| ', telefone) as Dados_Cliente from cliente
where autorizaservico = 'Autorizado';
             
                
                -- Recupera os dados do cliente e autorização do serviço e mosta valores de os abaixo de 700 linkando as tabelas cliente, os e veiculo
                select  idCliente, concat(nome, '| ', endereco, ' | ', telefone, ' |',autorizaservico) as Dados_do_Clente_Aprovação, valor as Total_valor from cliente
                inner join veiculo v on idCliente = v.idVeiculo
                inner join os o on v.idVeiculo = o.veiculo_idVeiculo
                group by o.idOs
                having o.valor < 700;
              



    
  

    

    
	
    
    
    
    
    
   