module Rules
  class TwoForOne
    MINIMUM_ITEMS = 1.0

    def initialize(basket)
      @basket = basket
    end

    def eligible?
      number_of_elegible_items > MINIMUM_ITEMS
    end

    def discount
      eligible_item[:price] * number_of_free_items
    end

    private
    attr_reader :basket

    def eligible_item
      @eligible_item ||= basket.find { |item| item[:code] == "FR1" }
    end

    def number_of_elegible_items
      @number_of_elegible_items ||= basket.count { |item| item[:code] == "FR1" }
    end

    def number_of_free_items
      (number_of_elegible_items * free_ratio).to_i
    end

    def free_ratio
      MINIMUM_ITEMS / number_of_elegible_items
    end
  end
end
