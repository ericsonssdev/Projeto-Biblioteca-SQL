-- Mais Emprestados

SELECT 
    L.Titulo,
    COUNT(*) AS TotalEmprestimos
FROM Emprestimos E
JOIN Livros L ON E.idLivro = L.idLivro
GROUP BY L.Titulo
ORDER BY TotalEmprestimos DESC;