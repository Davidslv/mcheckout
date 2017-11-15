module Rules
  class BulkDiscount
    MINIMUM_ITEMS = 3
    DISCOUNT_VALUE_PER_ITEM = 0.50

    def initialize(basket)
      @basket = basket
    end

    def elegible?
      elegible_item && number_of_elegible_items >= MINIMUM_ITEMS
    end

    def discount
      DISCOUNT_VALUE_PER_ITEM * number_of_elegible_items
    end

    private
    attr_reader :basket

    def elegible_item
      @elegible_item ||= basket.find { |product| product[:code] == "SR1" }
    end

    def number_of_elegible_items
      @number_of_elegible_items ||= basket.count { |product| product[:code] == "SR1" }
    end
  end
end
