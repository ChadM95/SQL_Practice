create proc procBalanceDue
@balanceMin money = 0

AS

select VendorName, InvoiceNumber, InvoiceTotal - PaymentTotal - CreditTotal as Balance 
from invoices i join vendors v ON i.VendorID = v.VendorID
where InvoiceTotal - PaymentTotal - CreditTotal > @balanceMin ;