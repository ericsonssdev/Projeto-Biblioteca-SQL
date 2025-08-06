-- Registrar Emprestimo

CREATE PROCEDURE RegistrarEmprestimo
    @idMembro INT,
    @idLivro INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar se o livro j� est� emprestado
    IF EXISTS (
        SELECT 1
        FROM Emprestimos
        WHERE idLivro = @idLivro
          AND DataDevolucaoReal IS NULL
    )
    BEGIN
        PRINT '? O livro j� est� emprestado e n�o pode ser alugado agora.';
        RETURN;
    END

    -- Inserir o novo empr�stimo com devolu��o prevista para 7 dias depois
    INSERT INTO Emprestimos (idMembro, idLivro, DataEmprestimo, DataDevolucaoPrevista)
    VALUES (@idMembro, @idLivro, GETDATE(), DATEADD(DAY, 7, GETDATE()));

    PRINT '? Empr�stimo registrado com sucesso!';
END;
