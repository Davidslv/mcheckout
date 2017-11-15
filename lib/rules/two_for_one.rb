module Rules
  class TwoForOne
    MINIMUM = 1.0

    def initialize(basket)
      @basket = basket
    end

    def elegible?
      number_of_elegible_items > MINIMUM
    end

    def discount
      elegible_item[:price] * number_of_free_items
    end

    private
    attr_reader :basket

    def elegible_item
      basket.find { |product| product[:code] == "FR1" }
    end

    def number_of_elegible_items
      basket.count { |product| product[:code] == "FR1" }
    end

    def number_of_free_items
      (number_of_elegible_items * free_ratio).to_i
    end

    def free_ratio
      MINIMUM / number_of_elegible_items
    end
  end
end
