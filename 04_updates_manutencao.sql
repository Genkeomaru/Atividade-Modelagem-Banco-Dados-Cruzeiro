USE UniFaculdade;
GO

-- =================================================================
-- CENÁRIO 1: CORREÇÃO DE NOTA
-- O Professor Alan Turing digitou errado a nota do Guilherme.
-- Era 9.5, mas ele merece 10.0.
-- =================================================================

-- PASSO 1: Sempre consulte antes para garantir que é o ID certo
SELECT * FROM Diario_Classe 
WHERE id_matricula = 1; -- Guilherme

-- PASSO 2: Execute a alteração com segurança (Transaction)
BEGIN TRANSACTION;
    UPDATE Diario_Classe
    SET Nota = 10.0
    WHERE id_matricula = 1 AND id_turma = 1; -- Seja específico!
COMMIT;

-- =================================================================
-- CENÁRIO 2: MUDANÇA DE ENDEREÇO
-- A Ana DataScience mudou de casa.
-- =================================================================
UPDATE Aluno
SET 
    Endereco = 'Rua do Python, 1024',
    CEP = '02222000'
WHERE Nome_completo = 'Ana DataScience'; 
-- Nota: Num sistema real, usaríamos o ID_Aluno, nunca o nome (podem ter homônimos)

-- =================================================================
-- CENÁRIO 3: APAGAR DADOS (CUIDADO!)
-- O Pedro desistiu do curso. Como apagar?
-- ORDEM: Primeiro apaga as dependências (Matrícula), depois o Aluno.
-- =================================================================

-- 1. Verificamos se ele tem notas (Se tiver, deletamos do diário primeiro)
DELETE FROM Diario_Classe WHERE id_matricula IN (SELECT id_matricula FROM Matricula WHERE id_aluno = 3);

-- 2. Apagamos a matrícula
DELETE FROM Matricula WHERE id_aluno = 3;

-- 3. Finalmente, apagamos o aluno
DELETE FROM Aluno WHERE id_aluno = 3;