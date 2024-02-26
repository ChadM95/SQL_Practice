CREATE PROC procGLAccountItemsCount
@accNo int

AS

return (SELECT COUNT(*) 
		FROM InvoiceLineItems i
		JOIN GLAccounts g ON i.AccountNo = g.AccountNo 
		WHERE g.AccountNo = @accNo) ;
 