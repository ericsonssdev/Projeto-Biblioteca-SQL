-- Inserindo Autores

EXEC sp_help Autores;

INSERT INTO Autores (Nome, Nacionalidade) VALUES
('Machado de Assis', 'Brasileiro'),
('J.K. Rowling', 'Brit�nica'),
('George Orwell', 'Brit�nico'),
('Paulo Coelho', 'Brasileiro');

-- Visualizar Dados
SELECT * FROM Autores;