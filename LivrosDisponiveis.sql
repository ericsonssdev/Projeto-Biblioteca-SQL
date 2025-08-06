-- Livros Disponiveis

SELECT 
    L.idLivro,
    L.Titulo,
    A.Nome AS Autor
FROM Livros L
JOIN Autores A ON L.idAutor = A.idAutor
WHERE L.idLivro NOT IN (
    SELECT idLivro 
    FROM Emprestimos 
    WHERE DataDevolucaoReal IS NULL
);
