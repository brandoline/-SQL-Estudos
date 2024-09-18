CREATE DATABASE IF NOT EXISTS prova;
USE prova;

CREATE TABLE EnderecoEmpresa(
IdEndereco INTEGER AUTO_INCREMENT PRIMARY KEY,
Rua VARCHAR(255),
Numero VARCHAR(255),
Bairro VARCHAR(255),
Cidade VARCHAR(255),
Cep CHAR(9)
);

CREATE TABLE Cliente(
IdCliente INTEGER AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255),
CPF CHAR(11),
Telefone CHAR(11),
FK_IdEndereco INT,
CONSTRAINT FOREIGN KEY (FK_IdEndereco) REFERENCES EnderecoEmpresa(IdEndereco)
);

CREATE TABLE Status(
IdStatus INTEGER AUTO_INCREMENT PRIMARY KEY,
NomeStatus VARCHAR(255)
);

CREATE TABLE Carro(
IdCarro INTEGER AUTO_INCREMENT PRIMARY KEY,
Modelo VARCHAR(100),
Marca CHAR(50),
AnoFabricacao DATE,
Placa CHAR(7),
Cor VARCHAR(50),
FK_StatusAtual INT,
CONSTRAINT FOREIGN KEY (FK_StatusAtual) REFERENCES Status(IdStatus)
);

CREATE TABLE FuncionariosEmpresa(
IdFuncionarios INTEGER AUTO_INCREMENT PRIMARY KEY,
Nome Varchar(255),
Cargo Varchar(50),
DataContratacao DATE
);

CREATE TABLE Transacoes(
IdTransacoes INTEGER AUTO_INCREMENT PRIMARY KEY,
DataInicio DATE,
DataPrevisto DATE,
DataDevolucao DATE,
ValorTotal DOUBLE,
FK_StatusAluguel INT,
FK_IdCliente INT,
FK_IdCarro INT,
CONSTRAINT FOREIGN KEY (FK_StatusAluguel) REFERENCES Status(IdStatus),
CONSTRAINT FOREIGN KEY (FK_IdCliente) REFERENCES Cliente(IdCliente),
CONSTRAINT FOREIGN KEY (FK_IdCarro) REFERENCES Carro(IdCarro)
);

INSERT INTO EnderecoEmpresa (Rua, Numero, Bairro, Cidade, Cep) VALUES
('Avenida Paulista', '1578', 'Centro', 'São Paulo', '01310-200'),
('Rua Augusta', '1234', 'Consolação', 'São Paulo', '01305-000'),
('Rua das Flores', '456', 'Jardim Botânico', 'Rio de Janeiro', '22260-000'),
('Avenida Atlântica', '789', 'Copacabana', 'Rio de Janeiro', '22070-002'),
('Rua XV de Novembro', '1010', 'Centro', 'Curitiba', '80060-000'),
('Rua da Praia', '202', 'Centro', 'Porto Alegre', '90010-000'),
('Avenida Beira-Mar', '3030', 'Meireles', 'Fortaleza', '60165-121');

INSERT INTO Cliente (Nome, CPF, Telefone, FK_IdEndereco) VALUES
('João Silva', '12345678901', '11987654321', 1),
('Maria Oliveira', '23456789012', '11912345678', 2),
('Pedro Santos', '34567890123', '11923456789', 3),
('Ana Costa', '45678901234', '11934567890', 4),
('Carlos Almeida', '56789012345', '11945678901', 5);

INSERT INTO Status(NomeStatus) VALUES
('Ativo'),
('Finalizado'),
('Cancelado');

INSERT INTO Carro (Modelo, Marca, AnoFabricacao, Placa, Cor, FK_StatusAtual) VALUES
('Fusca', 'Volkswagen', '1967-05-12', 'ABC1234', 'Azul', 1),
('Civic', 'Honda', '2020-03-15', 'XYZ5678', 'Preto', 1),     
('Corolla', 'Toyota', '2018-11-23', 'LMN9012', 'Branco', 2),
('Mustang', 'Ford', '2022-07-09', 'GHI3456', 'Vermelho', 1),
('Onix', 'Chevrolet', '2021-01-20', 'JKL7890', 'Prata', 3),
('A3', 'Audi', '2019-10-30', 'MNO2345', 'Cinza', 3),         
('X6', 'BMW', '2023-06-17', 'PQR6789', 'Preto', 2);

INSERT INTO FuncionariosEmpresa (Nome, Cargo, DataContratacao) VALUES
('Ana Souza', 'Gerente de Vendas', '2020-03-15'),
('Bruno Oliveira', 'Analista de TI', '2019-08-21'),
('Carlos Pereira', 'Assistente Administrativo', '2021-01-10'),
('Diana Silva', 'Coordenadora de Marketing', '2022-07-01');

INSERT INTO Transacoes (DataInicio, DataPrevisto, DataDevolucao, ValorTotal, FK_StatusAluguel, FK_IdCliente, FK_IdCarro) VALUES
('2024-09-01', '2024-09-15', '2024-09-14', 1200.00, 3, 1, 1),
('2024-09-05', '2024-09-20', NULL, 1500.00, 2, 2, 2),
('2024-09-10', '2024-09-25', NULL, 1000.00, 1, 3, 3), 
('2024-09-12', '2024-09-22', '2024-09-20', 2000.00, 2, 4, 4);
