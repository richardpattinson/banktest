describe AccountManager do

    describe '#deposit' do 
        it 'adds a new transaction to the account history' do 
            account = AccountManager.new 
            account.deposit(100, '10-01-2012')
            expect(account.account_history.length).to eq(1)
            expect(account.balance).to eq(100)
        end
    end
    describe '#withdraw' do 
        it 'adds a new transaction to the account history' do 
            account = AccountManager.new 
            account.withdraw(100, '10-01-2012')
            expect(account.account_history.length).to eq(1)
            expect(account.balance).to eq(-100)
        end
    end
    describe '#print' do
        it 'correctly displays formatted account status' do 
            account = AccountManager.new
            account.withdraw(500, '14-01-2012')
            account.deposit(2000, '13-01-2012')
            account.deposit(1000, '10-01-2012')
            expect{account.print}.to output("date || credit || debit || balance\n01/14/2012 || || 500 || 2500\n01/13/2012 || 2000 || || 3000\n01/10/2012 || 1000 || || 1000\n").to_stdout
        end
        it 'correctly displays formatted account status when dates are input in the wrong order' do 
            account = AccountManager.new
            account.deposit(2000, '13-01-2012')
            account.deposit(1000, '10-01-2012')
            account.withdraw(500, '14-01-2012')
            expect{account.print}.to output("date || credit || debit || balance\n01/14/2012 || || 500 || 2500\n01/13/2012 || 2000 || || 3000\n01/10/2012 || 1000 || || 1000\n").to_stdout
        end
        it 'correctly displays formatted account status for a couple of different test cases' do 
            account = AccountManager.new
            account.withdraw(1600, '14-01-2012')
            account.deposit(2700, '13-01-2012')
            account.deposit(7500, '10-01-2012')
            expect{account.print}.to output("date || credit || debit || balance\n01/14/2012 || || 1600 || 8600\n01/13/2012 || 2700 || || 10200\n01/10/2012 || 7500 || || 7500\n").to_stdout
        end
    end

end
