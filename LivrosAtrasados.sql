-- Livros de emprestimos em atraso

SELECT 
    E.idEmprestimo,
    M.Nome AS Membro,
    L.Titulo,
    E.DataEmprestimo,
    E.DataDevolucaoPrevista
FROM Emprestimos E
JOIN Membros M ON E.idMembro = M.idMembro
JOIN Livros L ON E.idLivro = L.idLivro
WHERE E.DataDevolucaoReal IS NULL
  AND E.DataDevolucaoPrevista < GETDATE();