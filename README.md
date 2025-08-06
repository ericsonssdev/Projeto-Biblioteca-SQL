# 📚 Projeto Biblioteca - SQL Server

Um sistema de gerenciamento de biblioteca desenvolvido em **SQL Server** para fins de estudo e portfólio.  
O projeto demonstra habilidades em modelagem de banco de dados, criação de procedures, triggers e organização de scripts SQL.

---

## 🚀 Funcionalidades

- 📖 **Cadastro de Autores, Livros e Membros**
- 📦 **Registro de Empréstimos** com verificação de disponibilidade
- 🔄 **Registro de Devoluções**
- 💰 **Cálculo automático de multas por atraso** via Trigger
- 📊 **Consultas úteis** para acompanhamento

---

## 🗄 Estrutura do Banco

Tabelas:
- **Autores**
- **Livros**
- **Membros**
- **Emprestimos**
- **Multas**

---

## 📂 Estrutura de Arquivos

- `create_tables.sql` → Criação do banco e tabelas
- `insert_data.sql` → Inserção de dados fictícios
- `procedures.sql` → Procedures para registrar empréstimos e devoluções
- `triggers.sql` → Trigger para cálculo automático de multa
- `queries.sql` → Consultas SQL para relatórios
- `.gitignore` → Arquivos ignorados pelo Git (ex.: `.mdf`, `.ldf`)
- `diagram.png` → Diagrama ER do banco (opcional

- ---

## 📊 Exemplo de Uso

### Registrar um Empréstimo
```sql
EXEC RegistrarEmprestimo @MembroID = 1, @LivroID = 3;

- 📌 Observações
Este projeto é apenas para fins de estudo.

Os arquivos .mdf e .ldf não estão inclusos, apenas os scripts .sql para recriar o banco.

Testado no SQL Server 2019.
