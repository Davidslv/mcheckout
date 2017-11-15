require 'pry'
require './lib/rules/two_for_one'

class Checkout
  PRODUCTS = [
    {
      code: "FR1",
      name: "Fruit Tea",
      price: 3.11
    },
    {
      code: "SR1",
      name: "Strawberries",
      price: 5.00
    },
    {
      code: "CF1",
      name: "Coffee",
      price: 11.23
    }
  ]

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @basket = []
    @total = 0
  end

  def scan(product_code)
    basket << PRODUCTS.find { |product| product[:code] == product_code }
  end

  def total
    return 0 if basket.empty?

    basket.map { |product| @total += product[:price] }

    @pricing_rules.each do |pricing_rule|
      rule = pricing_rule.new(basket)

      if rule.elegible?
        @total -= rule.discount
      end
    end

    @total.round(2)
  end

  private
  attr_reader :basket
end
