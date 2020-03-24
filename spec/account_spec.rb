
describe AccountManager do

    describe '#deposit' do 
        it 'adds a new transaction to the account history' do 
            account = AccountManager.new 
            account.deposit(100)
            expect(account.account_history.length).to eq(1)
            expect(account.balance).to eq(100)
        end
    end
    describe '#withdraw' do 
        it 'adds a new transaction to the account history' do 
            account = AccountManager.new 
            account.withdraw(100)
            expect(account.account_history.length).to eq(1)
            expect(account.balance).to eq(-100)
        end
    end
    describe '#print' do
        it 'correctly displays formatted account status' do
            account = AccountManager.new
            account.withdraw(500)
            account.deposit(2000)
            account.deposit(1000)
            expect{account.print}.to output("date || credit || debit || balance\n05/15/2020 || 1000 || || 2500\n05/15/2020 || 2000 || || 1500\n05/15/2020 || || 500 || -500\n").to_stdout
        end
        it 'correctly displays formatted account status when dates are input in the wrong order' do 
            account = AccountManager.new
            account.deposit(2000)
            account.deposit(1000)
            account.withdraw(500)
            expect{account.print}.to output("date || credit || debit || balance\n05/15/2020 || || 500 || 2500\n05/15/2020 || 1000 || || 3000\n05/15/2020 || 2000 || || 2000\n").to_stdout
        end
        it 'correctly displays formatted account status for a couple of different test cases' do 
            account = AccountManager.new
            account.withdraw(1600)
            account.deposit(2700)
            account.deposit(7500)
            expect{account.print}.to output("date || credit || debit || balance\n05/15/2020 || 7500 || || 8600\n05/15/2020 || 2700 || || 1100\n05/15/2020 || || 1600 || -1600\n").to_stdout
        end
    end

end
