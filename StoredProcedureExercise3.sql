--this script tests the previous stored procedure 5 times and prints each result

declare @answer int;

exec @answer = procNumberOfBalancesInRange
	 print 'no parameters'
	 print convert(varchar,@answer) ;

exec @answer = procNumberOfBalancesInRange @minBalance = 100
	 print 'only 1 parameter - minBalance 100'
	 print convert(varchar,@answer) ;

exec @answer = procNumberOfBalancesInRange @minbalance = 100, @maxBalance = 10000
	 print 'min 100, max 10,000'
	 print convert(varchar,@answer) ;

exec @answer = procNumberOfBalancesInRange @minBalance = 10000, @maxBalance = 100
	 print 'min 10000, max 100'
	 print convert(varchar,@answer) ;

exec @answer = procNumberOfBalancesInRange @maxBalance = 40
	 print '1 parameter - max balance 40'
	 print convert(varchar,@answer) ;