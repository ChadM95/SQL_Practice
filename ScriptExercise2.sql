use AP_2023

--declare variables
declare @totalBalance money

--set variable
set @totalBalance = (select sum(InvoiceTotal - PaymentTotal - CreditTotal) from Invoices)

--conditionals control result
if (@totalBalance > 10000)
	select VendorName, InvoiceNumber, InvoiceDueDate, InvoiceTotal - PaymentTotal - CreditTotal as Balance
	from Invoices i join Vendors v ON i.VendorID = v.VendorID
	where InvoiceTotal - PaymentTotal - CreditTotal > 0

else print 'Total Balance is less than 10,000' ; 