-- Registrar Emprestimo

CREATE PROCEDURE RegistrarEmprestimo
    @idMembro INT,
    @idLivro INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar se o livro já está emprestado
    IF EXISTS (
        SELECT 1
        FROM Emprestimos
        WHERE idLivro = @idLivro
          AND DataDevolucaoReal IS NULL
    )
    BEGIN
        PRINT '? O livro já está emprestado e não pode ser alugado agora.';
        RETURN;
    END

    -- Inserir o novo empréstimo com devolução prevista para 7 dias depois
    INSERT INTO Emprestimos (idMembro, idLivro, DataEmprestimo, DataDevolucaoPrevista)
    VALUES (@idMembro, @idLivro, GETDATE(), DATEADD(DAY, 7, GETDATE()));

    PRINT '? Empréstimo registrado com sucesso!';
END;
