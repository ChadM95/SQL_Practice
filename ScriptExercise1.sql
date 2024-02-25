use AP_2023

declare @invCnt int
declare @aDate date

set @aDate = DATEADD(year,-1,GETDATE())

set @invCnt = (select count(*) from invoices
				where InvoiceDate >= @aDate)

print @aDate

if (@invCnt > 0)
	print 'There were ' + convert(varchar,@invCnt,1) + ' invoices in the past year'
	
else print 'There were no invoices in the past year' ;