create proc procNumberOfBalancesInRange
@balanceMin money = 0,
@balanceMax money = 0

AS

if ( @balanceMax > @balanceMin AND @balanceMax <> 0 )
	begin
		return -1
	end

else if (@balanceMax = 0)
	begin
		return (select count(*)
		from Invoices 
		where InvoiceTotal - PaymentTotal - CreditTotal >= @balanceMin)
	end

else 
	begin
		return (select count(*)  
		from Invoices
		where InvoiceTotal - PaymentTotal - CreditTotal > @balanceMin
		AND InvoiceTotal - PaymentTotal - CreditTotal < @balanceMax)
	end
;