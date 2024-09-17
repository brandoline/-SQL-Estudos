USE prova;

CREATE TABLE Endereco(
IdEndereco INTEGER AUTO_INCREMENT PRIMARY KEY,
Rua VARCHAR(255),
Numero VARCHAR(255),
Bairro VARCHAR(255),
Cidade VARCHAR(255),
Cep CHAR(8)
);

CREATE TABLE Clientes(
IdCliente INTEGER AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255),
CPF CHAR(11),
Telefone CHAR(11),
FK_IdEndereco INT,
CONSTRAINT FOREIGN KEY (FK_IdEndereco) REFERENCES Endereco(IdEndereco)
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
CONSTRAINT FOREIGN KEY (FK_StatusAtual) REFERENCES Status(NomeStatus)
);

CREATE TABLE Funcionarios(
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
CONSTRAINT FOREIGN KEY (FK_StatusAluguel) REFERENCES Status(IdStatus)
);

CREATE TABLE Transacoes(
);