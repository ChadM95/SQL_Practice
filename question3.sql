use AP_2023

declare @answer int

exec @answer = procGLAccountItemsCount 205

if (@answer > 5)
	print 'High turnover: Number of line items : ' + convert(varchar,@answer)

else if (@answer = 0)
	print 'No line items for this account'

else print 'Medium turnover: Number of line items : ' + convert(varchar,@answer) ;
