USE AP_2023

declare @invAmnt int

set @invAmnt = (SELECT count(*) FROM Invoices i
				JOIN Vendors v ON i.VendorID = v.VendorID 
				WHERE VendorState = 'DC')

if (@invAmnt > 0)
	print 'The total number of Invoices from DC is ' + convert(varchar, @invAmnt, 1)

else 
	print 'There are no invoices from DC';