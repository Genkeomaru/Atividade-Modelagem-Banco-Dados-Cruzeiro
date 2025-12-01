# 🎓 Sistema de Gestão Acadêmica (UniFaculdade)

Projeto de modelagem e implementação de banco de dados relacional para uma universidade fictícia, desenvolvido para demonstrar competências em SQL Server e T-SQL.

![Status do Projeto](https://img.shields.io/badge/Status-Concluído-green) ![SQL Server](https://img.shields.io/badge/Database-SQL%20Server-red)

## 📋 Sobre o Projeto
Este repositório contém a estrutura completa de um banco de dados universitário, cobrindo desde a criação das tabelas (DDL) até a manipulação avançada de dados (DML) e relatórios gerenciais (DQL).

O objetivo foi simular um ambiente real onde é necessário gerenciar:
- Alunos e Professores
- Cursos e Matérias
- Turmas e Matrículas
- Diários de Classe (Notas e Faltas)

## 🗂 Estrutura do Banco de Dados
O projeto foi modelado seguindo as formas normais para garantir integridade referencial.
*(Insira aqui o print do seu Diagrama: diagrama_db.png)*

## 🚀 Como Executar
Os scripts foram numerados para execução sequencial, garantindo que as dependências (Foreign Keys) sejam respeitadas.

1. **01_create_database.sql**: Cria o banco e a estrutura das tabelas.
2. **02_inserts_seed.sql**: Popula o banco com dados fictícios (Seed), limpando dados antigos e resetando IDs.
3. **03_selects_relatorios.sql**: Gera relatórios gerenciais (Boletim, Contagem de alunos, etc).
4. **04_updates_manutencao.sql**: Exemplos de transações de update e delete seguros.

## 📊 Exemplos de Consultas (DQL)

### 1. Histórico Escolar Completo
Query utilizando múltiplos `JOINs` para cruzar Aluno, Matéria, Professor e Notas, incluindo lógica de aprovação (`CASE WHEN`).

```sql
SELECT 
    A.Nome_completo AS Aluno,
    M.Nome AS Materia,
    CASE 
        WHEN D.Nota >= 6 THEN 'APROVADO'
        ELSE 'REPROVADO'
    END AS Status_Final
...
