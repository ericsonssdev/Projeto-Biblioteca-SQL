-- Calcular multa automatica

CREATE TRIGGER trg_CalcularMulta
ON Emprestimos
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @idEmprestimo INT;
    DECLARE @DataPrevista DATE;
    DECLARE @DataDevolucao DATE;
    DECLARE @DiasAtraso INT;
    DECLARE @ValorMulta DECIMAL(6,2);

    -- Pega o registro que foi atualizado
    SELECT 
        @idEmprestimo = i.idEmprestimo,
        @DataPrevista = i.DataDevolucaoPrevista,
        @DataDevolucao = i.DataDevolucaoReal
    FROM inserted i;

    -- Se não houver data de devolução, não faz nada
    IF @DataDevolucao IS NULL
        RETURN;

    -- Calcula dias de atraso
    SET @DiasAtraso = DATEDIFF(DAY, @DataPrevista, @DataDevolucao);

    -- Se houve atraso, registra multa
    IF @DiasAtraso > 0
    BEGIN
        SET @ValorMulta = @DiasAtraso * 2.00; -- R$ 2 por dia
        INSERT INTO Multas (idEmprestimo, Valor, Pago)
        VALUES (@idEmprestimo, @ValorMulta, 0);

        PRINT CONCAT('? Houve atraso de ', @DiasAtraso, ' dias. Multa registrada: R$ ', @ValorMulta);
    END
END;


