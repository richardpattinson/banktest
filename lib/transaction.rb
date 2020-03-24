class Transaction
    attr_reader :value, :type, :date
    def initialize(value, type)
        @value = value
        @type = type
        @date = Time.now
    end
end