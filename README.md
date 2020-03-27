## Bank 

This is a simple app to manage a bank account, it can store and track deposits and withdrawals with the date that they were made and print an account statement reflecting this information.

## INSTRUCTIONS
run irb, requiring './lib/account'
All methods performed on the 'account' instance of the AccountManager class.

account.deposit(1000, '10-01-2012') <br/>
account.deposit(2000, '13-01-2012') <br/>
account.withdraw(500, '14-01-2012') <br/>
account.print<br/>

should return:

date || credit || debit || balance <br/>
14/01/2012 || || 500.00 || 2500.00 <br/>
13/01/2012 || 2000.00 || || 3000.00 <br/>
10/01/2012 || 1000.00 || || 1000.00 <br/>



