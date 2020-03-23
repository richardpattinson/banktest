require 'time'
require 'transaction'
class AccountManager
    attr_reader :account_history, :balance
    def initialize
        @balance = 0
        @account_history = []
    end
    def deposit(value, date)
        deposit = Transaction.new(value, "deposit", date)
        @balance += value
        @account_history.push(deposit)
    end
    def withdraw(value, date)
        withdraw = Transaction.new(value, "withdrawal", date)
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

class Transaction
    attr_reader :value, :type, :date
    def initialize(value, type, date)
        @value = value
        @type = type
        @date = Time.strptime(date, "%d-%m-%Y")
    end
end
account = AccountManager.new