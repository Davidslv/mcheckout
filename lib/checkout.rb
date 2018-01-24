require './lib/rules/two_for_one'
require './lib/rules/bulk_discount'

class Checkout
  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @basket = []
    @total = 0
  end

  def scan(product_code)
    basket << Warehouse.find("FR1")
  end

  def total
    return 0 if basket.empty?

    basket.map { |product| @total += product[:price] }

    @pricing_rules.each do |pricing_rule|
      rule = pricing_rule.new(basket)

      if rule.eligible?
        @total -= rule.discount
      end
    end

    @total.round(2)
  end

  private
  attr_reader :basket
end
