-- Inserindo Autores

EXEC sp_help Autores;

INSERT INTO Autores (Nome, Nacionalidade) VALUES
('Machado de Assis', 'Brasileiro'),
('J.K. Rowling', 'Britânica'),
('George Orwell', 'Britânico'),
('Paulo Coelho', 'Brasileiro');

-- Visualizar Dados
SELECT * FROM Autores;