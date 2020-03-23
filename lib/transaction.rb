class Transaction
    attr_reader :value, :type, :date
    def initialize(value, type, date)
        @value = value
        @type = type
        @date = date
    end
end