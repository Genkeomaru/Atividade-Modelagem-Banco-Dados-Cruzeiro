# 🎓 Atividade Prática: Modelagem de Banco de Dados

**Universidade:** Cruzeiro do Sul Virtual  
**Curso:** Análise e Desenvolvimento de Sistemas (ADS)  
**Disciplina:** Modelagem de Banco de Dados  
**Aluno:** Guilherme Rodrigues de Assis Santos
**RGM:** 46610120  

---

## 📋 Descrição do Projeto
Este projeto consiste na implementação prática de um banco de dados relacional para um sistema de gestão acadêmica ("UniFaculdade"). O objetivo é demonstrar a competência na criação de estruturas de dados (DDL), manipulação de registros (DML) e construção de consultas relacionais (DQL) utilizando **SQL Server**.

## 🏗 Explicação da Estrutura (Modelagem)
O banco de dados foi estruturado seguindo as regras de normalização para evitar redundância e garantir a integridade dos dados. A lógica do relacionamento entre as entidades é a seguinte:

* **Faculdade & Cursos (1:N):** Uma faculdade possui vários cursos, mas um curso pertence a uma única unidade.
* **Alunos & Matrículas (1:N):** O cadastro do aluno (`Aluno`) é separado de seu vínculo com o curso. A tabela `Matricula` atua como o elo, permitindo que o sistema escale (caso o aluno faça mais de um curso futuramente).
* **Cursos & Matérias (1:N):** Cada curso possui sua grade curricular composta por várias matérias.
* **Turmas (Entidade Associativa):** A `Turma` é o ponto central que conecta **Professor**, **Matéria** e o **Semestre** (ex: 2025.1). Isso permite saber qual professor ministrou qual matéria em determinado período.
* **Diário de Classe (N:N Resolvida):** Representa a relação entre a **Turma** e a **Matrícula** do aluno. É aqui que ficam as notas e faltas, pois a nota não pertence só ao aluno, nem só à matéria, mas ao desempenho daquele aluno naquela turma específica.

## 🛠 Scripts SQL Desenvolvidos

Os scripts foram organizados sequencialmente para garantir a integridade referencial durante a execução:

1.  **`01_create_database.sql`**: Script DDL responsável pela criação do banco e das tabelas com suas respectivas Chaves Primárias (PK) e Estrangeiras (FK).
2.  **`02_inserts_seed.sql`**: Script de população inicial (Seed). Inclui comandos de limpeza (`DELETE`) e reinicialização de IDs (`DBCC CHECKIDENT`) para testes recorrentes.
3.  **`03_selects_relatorios.sql`**: Consultas DQL utilizando `INNER JOIN`, `LEFT JOIN` e funções de agregação (`COUNT`) para gerar relatórios gerenciais.
4.  **`04_updates_manutencao.sql`**: Demonstração de comandos DML (`UPDATE`, `DELETE`) com cláusulas de segurança (`WHERE`) e transações.

## 📊 Evidências de Execução

### Diagrama de Entidade-Relacionamento (DER)
<img width="1287" height="757" alt="Diagrama_db" src="https://github.com/user-attachments/assets/64833e03-4115-4cf0-ac53-5803f1a24ebf" />


### Exemplo de Relatório (Boletim Escolar)
Consulta SQL que unifica dados de 5 tabelas para exibir a situação do aluno.
<img width="822" height="302" alt="resultado" src="https://github.com/user-attachments/assets/e3d66e36-ad53-4b5c-aa47-59d595f31dc6" />


---
*Projeto desenvolvido para fins acadêmicos e composição de portfólio profissional.*
