module Currency
  class Converters
    attr_reader :value, :from, :to

    def initialize(value:, from:, to:)
      @value = value
      @from = from
      @to = to
    end
    
    def convert()
      Money.from_amount(value, from)
      .exchange_to(to)
    end

    def set_rate()
      rate = Currency::Rates.new(from:from, to:to).get_rate
      Money.add_rate(from, to, rate)
    end
  end
end