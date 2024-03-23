ALTER FUNCTION dbo.fnEarliestUnpaidDate (@VendorID int) 
returns DATE 
AS 
BEGIN

IF (@VendorID IS NULL)
    RETURN NULL;

DECLARE @earliestUnpaidInv DATE;

SELECT @earliestUnpaidInv = MIN(InvoiceDate)
FROM Invoices
WHERE VendorID = @VendorID                                                                                 
AND (InvoiceTotal - PaymentTotal) > 0;

IF (@earliestUnpaidInv IS NULL)
    RETURN NULL;

RETURN @earliestUnpaidInv

END;