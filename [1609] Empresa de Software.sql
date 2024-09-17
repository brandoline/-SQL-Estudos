CREATE DATABASE IF NOT EXISTS prova;
USE prova;

CREATE TABLE StatusProjeto(
IdStatus INTEGER AUTO_INCREMENT PRIMARY KEY,
NomeStatus VARCHAR(255)
);

CREATE TABLE Funcionarios(
IdFuncionarios INTEGER AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255),
Cargo VARCHAR(255),
Departamento VARCHAR(255)
);

CREATE TABLE Endereco(
IdEndereco INTEGER AUTO_INCREMENT PRIMARY KEY,
Cidade CHAR(3),
Bairro VARCHAR(255),
Rua VARCHAR(255),
Numero INT
);

CREATE TABLE Clientes(
IdClientes INTEGER AUTO_INCREMENT PRIMARY KEY,
NomeEmpresa VARCHAR(255),
PessoaContato VARCHAR(255),
Telefone CHAR(10),
FK_IdEndereco INTEGER,
CONSTRAINT FOREIGN KEY (FK_IdEndereco) REFERENCES Endereco(IdEndereco)
);

CREATE TABLE Projeto (
IdProjeto INTEGER AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255),
DataInicio DATE,
DataFim DATE,
FK_IdStatus INT,
FK_IdFuncionarios INT,
FK_IdClientes INT,
CONSTRAINT FOREIGN KEY (FK_IdStatus) REFERENCES StatusProjeto(IdStatus),
CONSTRAINT FOREIGN KEY (FK_IdFuncionarios) REFERENCES Funcionarios(IdFuncionarios),
CONSTRAINT FOREIGN KEY (FK_IdClientes) REFERENCES Clientes(IdClientes)
);

INSERT INTO StatusProjeto(NomeStatus) VALUES
('Andamento'),
('Concluido'),
('Cancelado');

INSERT INTO Funcionarios(Nome, Cargo, Departamento) VALUES
('Ana', 'Atendente', 'Vendas'),
('Marcos', 'Atendente', 'Vendas');

INSERT INTO Endereco(Cidade, Bairro, Rua, Numero) VALUES
('SP', 'Centro', 'Rua São Paulo', 123),
('RJ', 'Zona Sul', 'Avenida Atlântica', 456),
('BH', 'Savassi', 'Rua Professor Moraes', 789),
('POA', 'Centro Histórico', 'Rua da Praia', 101),
('POA', 'Batel', 'Avenida Sete de Setembro', 202);

INSERT INTO Clientes(NomeEmpresa, PessoaContato, Telefone, FK_IdEndereco) VALUES
('Tech Innovations Ltda.', 'Ana Paula Silva', '3012-3456', 1),
('Global Solutions Inc.', 'Carlos Eduardo Santos', '3022-4567', 2),
('Creative Designs Co.', 'Mariana Costa', '3032-5678', 3);

INSERT INTO Projeto(Nome, DataInicio, DataFim, FK_IdStatus, FK_IdFuncionarios, FK_IdClientes) VALUES
('Casa Modeladora', '2024-10-02', '2025-03-25', 2, 1, 3),
('Carro IA', '2024-03-10', NULL, 1, 2, 2),
('Music Player', '2024-01-23', '2024-02-29', 3, 1, 1);

SELECT Projeto.Nome, Projeto.DataInicio, Projeto.DataFim, 
StatusProjeto.NomeStatus AS Status, 
Funcionarios.Nome AS Funcionarios 
FROM Projeto
JOIN StatusProjeto ON StatusProjeto.IdStatus = Projeto.FK_IdStatus
JOIN Funcionarios ON Funcionarios.IdFuncionarios = Projeto.Fk_IdFuncionarios;


