--how many invoices were issued on this date one year ago
--set variable = this date -1 year and run query between that date and the next ie. > 1 and < the next 
use AP_2023

declare @invCnt int
declare @aDate date
set @aDate = DATEADD(year,-1,GETDATE())

--calculations
set @invCnt = (select count(*) from invoices
				where InvoiceDate > @aDate AND InvoiceDate < DATEADD(day,1,@aDate))

--conditional controls result
if (@invCnt > 0)
	print 'There were ' + convert(varchar,@invCnt,1) + ' many Invoices issued on this date 1 year ago'

else print 'There were no invoices issued on this day 1 year ago' ; 
