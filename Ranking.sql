-- Ranking de Membros que mais pegam livros

SELECT 
    M.Nome,
    COUNT(*) AS TotalEmprestimos
FROM Emprestimos E
JOIN Membros M ON E.idMembro = M.idMembro
GROUP BY M.Nome
ORDER BY TotalEmprestimos DESC;