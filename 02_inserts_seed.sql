USE UniFaculdade;
GO

-- 1. FACULDADE
INSERT INTO Faculdade (Nome, CNPJ, Endereco, Cidade, Estado)
VALUES ('UniTecnologia', '12345678000199', 'Av. Inovação, 2049', 'São Paulo', 'SP');

-- 2. CURSOS
INSERT INTO Curso (Nome, Carga_horaria, Previsao_conclusao, id_unidade)
VALUES 
('Análise e Desenv. Sistemas', 2400, 5, 1),
('Engenharia de Software', 3600, 8, 1),
('Ciência de Dados', 3000, 6, 1);

-- 3. ALUNOS
INSERT INTO Aluno (Nome_completo, Data_nascimento, RG, CPF, Telefone, Email, CEP, Endereco, Cidade, Estado)
VALUES 
('Guilherme Dev', '2000-05-10', '40.123.456-X', '11122233344', '(11) 99999-1010', 'gui@dev.com', '01000000', 'Rua do Java, 10', 'São Paulo', 'SP'),
('Ana DataScience', '1999-08-25', '30.987.654-2', '22233344455', '(11) 98888-2020', 'ana@data.com', '02000000', 'Av. Python, 500', 'Campinas', 'SP'),
('Pedro Junior', '2002-01-15', '50.111.222-3', '33344455566', '(15) 97777-3030', 'pedro@jr.com', '18000000', 'Travessa SQL, 3', 'Sorocaba', 'SP');

-- 4. PROFESSORES
INSERT INTO Professores (Nome_completo, Data_nascimento, Telefone, Email, RG, CPF, Tipo_aula, Formacao, CEP, Endereco, Cidade, Estado)
VALUES 
('Prof. Alan Turing', '1954-06-23', '(11) 91111-0001', 'turing@uni.com', '10.000.000-1', '99988877700', 1, 3, '05000100', 'Rua da Lógica, 404', 'São Paulo', 'SP'),
('Prof. Ada Lovelace', '1980-12-10', '(11) 92222-0002', 'ada@uni.com', '20.000.000-2', '88877766655', 1, 3, '06000200', 'Av. Algoritmo, 200', 'Barueri', 'SP');

-- 5. MATÉRIAS
INSERT INTO Materias (Nome, id_curso)
VALUES 
('Banco de Dados Relacional', 1),
('Algoritmos e Lógica', 1),
('Inteligência Artificial', 3),
('Engenharia de Requisitos', 2);

-- 6. MATRÍCULAS
INSERT INTO Matricula (id_aluno, id_curso, Data_matricula)
VALUES 
(1, 1, '2025-01-15'),
(2, 3, '2025-01-16'),
(3, 1, '2025-01-20');

-- 7. TURMAS
INSERT INTO Turma (id_materia, id_professor, Ano_semestre, Sala)
VALUES 
(1, 2, '2025.1', 'Lab 01'),
(2, 1, '2025.1', 'Sala 3A'),
(3, 1, '2025.1', 'Lab 05');

-- 8. DIÁRIO DE CLASSE
INSERT INTO Diario_Classe (id_turma, id_matricula, Nota, Faltas)
VALUES 
(1, 1, 9.5, 0),
(2, 1, 8.0, 4),
(3, 2, 10.0, 0);

GO

SELECT * FROM Aluno;
SELECT * FROM Professores;