module Rules
  class BulkDiscount
    MINIMUM_ITEMS = 3
    DISCOUNT_VALUE_PER_ITEM = 0.50

    def initialize(basket)
      @basket = basket
    end

    def eligible?
      number_of_elegible_items >= MINIMUM_ITEMS
    end

    def discount
      factor = (number_of_elegible_items / MINIMUM_ITEMS).floor
      DISCOUNT_VALUE_PER_ITEM * factor
    end

    private
    attr_reader :basket

    def number_of_elegible_items
      @number_of_elegible_items ||= basket.count { |code| code == "SR1" }
    end
  end
end
