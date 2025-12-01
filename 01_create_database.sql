-- Garante que estamos usando o banco certo
USE UniFaculdade;
GO

-- 1. Tabela Faculdade
CREATE TABLE Faculdade (
    id_unidade INT IDENTITY(1,1) PRIMARY KEY, -- IDENTITY é o 'auto_increment' do SQL Server
    Nome VARCHAR(255) NOT NULL,
    CNPJ CHAR(14) NOT NULL UNIQUE,
    Endereco VARCHAR(255),
    Cidade VARCHAR(100),
    Estado CHAR(2)
);

-- 2. Tabela Curso
CREATE TABLE Curso (
    id_curso INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Carga_horaria INT,
    Previsao_conclusao INT, 
    id_unidade INT NOT NULL,
    CONSTRAINT fk_curso_unidade FOREIGN KEY (id_unidade) REFERENCES Faculdade(id_unidade)
);

-- 3. Tabela Aluno
CREATE TABLE Aluno (
    id_aluno INT IDENTITY(1,1) PRIMARY KEY,
    Nome_completo VARCHAR(255) NOT NULL,
    Data_nascimento DATE NOT NULL,
    RG VARCHAR(20),
    CPF CHAR(11) NOT NULL UNIQUE,
    Telefone VARCHAR(15),
    Email VARCHAR(255) UNIQUE,
    CEP CHAR(8),
    Endereco VARCHAR(255),
    Cidade VARCHAR(100),
    Estado CHAR(2)
);

-- 4. Tabela Matricula
CREATE TABLE Matricula (
    id_matricula INT IDENTITY(1,1) PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_curso INT NOT NULL,
    Data_matricula DATE DEFAULT GETDATE(), -- GETDATE() pega a data de hoje no SQL Server
    CONSTRAINT fk_matricula_aluno FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    CONSTRAINT fk_matricula_curso FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- 5. Tabela Materias
CREATE TABLE Materias (
    id_materia INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    id_curso INT NOT NULL,
    CONSTRAINT fk_materia_curso FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- 6. Tabela Professores
CREATE TABLE Professores (
    id_professor INT IDENTITY(1,1) PRIMARY KEY,
    Nome_completo VARCHAR(255) NOT NULL,
    Data_nascimento DATE,
    Telefone VARCHAR(15),
    Email VARCHAR(255) UNIQUE,
    RG VARCHAR(20),
    CPF CHAR(11) UNIQUE,
    Tipo_aula INT,
    Formacao INT,
    CEP CHAR(8),
    Endereco VARCHAR(255),
    Cidade VARCHAR(100),
    Estado CHAR(2)
);

-- 7. Tabela Turma
CREATE TABLE Turma (
    id_turma INT IDENTITY(1,1) PRIMARY KEY,
    id_materia INT NOT NULL,
    id_professor INT NOT NULL,
    Ano_semestre VARCHAR(6), -- Ex: '2025.1'
    Sala VARCHAR(20),
    CONSTRAINT fk_turma_materia FOREIGN KEY (id_materia) REFERENCES Materias(id_materia),
    CONSTRAINT fk_turma_professor FOREIGN KEY (id_professor) REFERENCES Professores(id_professor)
);

-- 8. Tabela Diario_Classe
CREATE TABLE Diario_Classe (
    id_turma INT NOT NULL,
    id_matricula INT NOT NULL,
    Nota DECIMAL(4,2) CHECK (Nota >= 0 AND Nota <= 10),
    Faltas INT DEFAULT 0,
    PRIMARY KEY (id_turma, id_matricula), -- Chave composta
    CONSTRAINT fk_diario_turma FOREIGN KEY (id_turma) REFERENCES Turma(id_turma),
    CONSTRAINT fk_diario_matricula FOREIGN KEY (id_matricula) REFERENCES Matricula(id_matricula)
);
GO