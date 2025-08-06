-- Registrar Devolução

CREATE PROCEDURE RegistrarDevolucao
    @EmprestimoID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @DataPrevista DATE;
    DECLARE @DiasAtraso INT;
    DECLARE @ValorMulta DECIMAL(6,2);

    -- Buscar data prevista
    SELECT @DataPrevista = DataDevolucaoPrevista
    FROM Emprestimos
    WHERE idEmprestimo = @EmprestimoID;

    IF @DataPrevista IS NULL
    BEGIN
        PRINT '? Empréstimo não encontrado.';
        RETURN;
    END

    -- Atualizar data real de devolução
    UPDATE Emprestimos
    SET DataDevolucaoReal = GETDATE()
    WHERE idEmprestimo = @EmprestimoID;

    -- Calcular dias de atraso
    SET @DiasAtraso = DATEDIFF(DAY, @DataPrevista, GETDATE());

    -- Se houve atraso, registrar multa
    IF @DiasAtraso > 0
    BEGIN
        SET @ValorMulta = @DiasAtraso * 2.00; -- R$ 2 por dia
        INSERT INTO Multas (idEmprestimo, Valor, Pago)
        VALUES (@EmprestimoID, @ValorMulta, 0);

        PRINT CONCAT('? Houve atraso de ', @DiasAtraso, ' dias. Multa registrada: R$ ', @ValorMulta);
    END
    ELSE
    BEGIN
        PRINT '? Devolução realizada sem multa.';
    END
END;