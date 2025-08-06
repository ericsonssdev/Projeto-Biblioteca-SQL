-- Listar todos os livros com nome do autor

SELECT 
    L.idLivro,
    L.Titulo,
    L.Categoria,
    L.AnoPublicacao,
    A.Nome AS Autor
FROM Livros L
JOIN Autores A ON L.idAutor = A.idAutor
ORDER BY L.Titulo