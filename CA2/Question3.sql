ALTER PROC procApplyPenaltyInterest
@invoiceID INT
AS
BEGIN

    --check if InvoiceID is null
    IF @invoiceID IS NULL
    BEGIN
        
        PRINT 'No invoice with that ID. Status: 5001, State: 1';
        RETURN;
    END


    BEGIN TRANSACTION;
        BEGIN TRY
        
        --Step 1
        UPDATE Invoices
        SET InvoiceTotal = InvoiceTotal * 1.05
        WHERE InvoiceID = @invoiceID;

        --Step 2
        UPDATE InvoiceLineItems
        SET InvoiceLineItemAmount = InvoiceLineItemAmount * 1.05
        WHERE InvoiceID = @invoiceID; 
    
        COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH

        ROLLBACK TRANSACTION;
        THROW 5001, 'Failed due to a transaction error. State: 1', 1;
    
    END CATCH;

END;