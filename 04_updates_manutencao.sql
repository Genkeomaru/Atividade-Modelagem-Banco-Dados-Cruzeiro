USE UniFaculdade;
GO

-- =================================================================
-- REQUISITO: 3 COMANDOS DE UPDATE COM CONDIÇÕES
-- =================================================================

-- UPDATE 1: Correção de Nota (Condição: ID da matrícula e turma)
-- Motivo: Professor digitou errado.
UPDATE Diario_Classe
SET Nota = 10.0
WHERE id_matricula = 1 AND id_turma = 1;

-- UPDATE 2: Atualização de Endereço (Condição: Nome do Aluno)
-- Motivo: Aluna mudou de residência.
UPDATE Aluno
SET Endereco = 'Rua Nova do Python, 99', CEP = '11111000'
WHERE Nome_completo = 'Ana DataScience';

-- UPDATE 3: Ajuste de Carga Horária (Condição: Nome do Curso)
-- Motivo: O MEC exigiu aumento de horas no curso de ADS.
UPDATE Curso
SET Carga_horaria = 2500
WHERE Nome = 'Análise e Desenv. Sistemas';


-- =================================================================
-- REQUISITO: 3 COMANDOS DE DELETE COM CONDIÇÕES
-- =================================================================

-- DELETE 1: Remover uma falta lançada errada (Delete simples)
-- Motivo: O aluno justificou a falta com atestado.
DELETE FROM Diario_Classe 
WHERE id_matricula = 1 AND id_turma = 2 AND Faltas > 0;

-- DELETE 2: Cancelar uma turma que não teve inscritos (Delete isolado)
-- Vamos supor que criamos uma turma extra (ID 99) sem querer.
-- (Primeiro vou criar ela só para poder deletar no exemplo)
INSERT INTO Turma (id_materia, id_professor, Ano_semestre, Sala) VALUES (1, 1, '2025.2', 'EAD');
-- Agora o comando de deletar:
DELETE FROM Turma 
WHERE Ano_semestre = '2025.2' AND Sala = 'EAD';

-- DELETE 3: Remoção completa de um aluno desistente (Delete em cascata manual)
-- Motivo: Pedro (ID 3) trancou a faculdade. Precisamos apagar tudo dele.
-- Primeiro removemos do diário (filho)
DELETE FROM Diario_Classe WHERE id_matricula IN (SELECT id_matricula FROM Matricula WHERE id_aluno = 3);
-- Depois removemos a matrícula (pai do diário, filho do aluno)
DELETE FROM Matricula WHERE id_aluno = 3;
-- Por fim removemos o aluno (pai de todos)
DELETE FROM Aluno WHERE id_aluno = 3;