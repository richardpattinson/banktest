require 'time'
require './lib/transaction'
class AccountManager
    attr_reader :account_history, :balance
    def initialize
        @balance = 0
        @account_history = []
    end
    def deposit(value)
        deposit = Transaction.new(value, "deposit")
        @balance += value
        @account_history.push(deposit)
    end
    def withdraw(value)
        withdraw = Transaction.new(value, "withdrawal")
        @balance -= value
        @account_history.push(withdraw)
    end
    def print
        sorted = self.sortbydate
        puts 'date || credit || debit || balance'
        current_balance = @balance
        sorted.reverse.each do |x|
            if x.type == 'withdrawal'
                puts "#{x.date.strftime("%m/%d/%Y")} || || #{x.value} || #{current_balance}"
                current_balance += x.value
            elsif x.type == 'deposit'
                puts "#{x.date.strftime("%m/%d/%Y")} || #{x.value} || || #{current_balance}"
                current_balance -= x.value
            end
        end
    end
    private
    def sortbydate
        sorted = @account_history.sort_by {|transaction|transaction.date}
    end

end


account = AccountManager.new