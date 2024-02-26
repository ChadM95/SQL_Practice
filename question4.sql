create proc procVendorsInvoiceDate
@accNo int,
@lastDate datetime = NULL

AS

SET @lastDate = ISNULL(@lastDate, GETDATE());

SELECT AccountNo, InvoiceLineItemDescription, InvoiceDate
FROM Invoices i JOIN InvoiceLineItems il ON i.InvoiceID = il.InvoiceID 
WHERE il.AccountNo = @accNo 
AND InvoiceDate < @lastDate ;  