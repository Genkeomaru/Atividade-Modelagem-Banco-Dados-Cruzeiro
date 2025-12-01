USE UniFaculdade;
GO

-- =================================================================
-- RELATÓRIO 1: O "HISTÓRICO ESCOLAR" COMPLETO
-- Objetivo: Mostrar quem estuda o quê, com qual professor e qual a nota.
-- Nível: Avançado (Usa 6 tabelas conectadas)
-- =================================================================
SELECT 
    A.Nome_completo AS Aluno,
    C.Nome AS Curso,
    M.Nome AS Materia,
    P.Nome_completo AS Professor,
    T.Sala,
    D.Nota,
    D.Faltas,
    -- Regra de Negócio no SQL (Case When):
    CASE 
        WHEN D.Nota >= 6 THEN 'APROVADO'
        ELSE 'REPROVADO'
    END AS Status_Final
FROM Aluno A
JOIN Matricula Mat ON A.id_aluno = Mat.id_aluno
JOIN Curso C ON Mat.id_curso = C.id_curso
JOIN Diario_Classe D ON Mat.id_matricula = D.id_matricula
JOIN Turma T ON D.id_turma = T.id_turma
JOIN Materias M ON T.id_materia = M.id_materia
JOIN Professores P ON T.id_professor = P.id_professor
ORDER BY A.Nome_completo;

-- =================================================================
-- RELATÓRIO 2: CONTAGEM DE ALUNOS POR CURSO
-- Objetivo: Ver qual curso está mais cheio
-- Nível: Intermediário (Usa Group By e Count)
-- =================================================================
SELECT 
    C.Nome AS Nome_do_Curso,
    COUNT(Mat.id_aluno) AS Total_Alunos
FROM Curso C
LEFT JOIN Matricula Mat ON C.id_curso = Mat.id_curso
GROUP BY C.Nome
ORDER BY Total_Alunos DESC;

-- =================================================================
-- RELATÓRIO 3: PROFESSORES DOUTORES
-- Objetivo: Filtrar staff qualificado
-- Nível: Básico (Filtro simples)
-- =================================================================
SELECT Nome_completo, Email 
FROM Professores 
WHERE Formacao = 3; -- 3 = Doutorado

-- =================================================================
-- RELATÓRIO 4: TOP 3 MAIORES CARGAS HORÁRIAS
-- Objetivo: Demonstrar uso de limite de registros (TOP no SQL Server equivale ao LIMIT)
-- Nível: Básico
-- =================================================================
SELECT TOP 3 Nome, Carga_horaria
FROM Curso
ORDER BY Carga_horaria DESC;