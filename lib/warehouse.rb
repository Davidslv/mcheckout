class Warehouse
  PRODUCTS = {
    "FR1" => {code: "FR1", name: "Fruite Tea", price: 3.11 },
    "SR1" => {code: "SR1", name: "Strawberries", price: 5.00 },
    "CF1" => {code: "CF1", name: "Coffee", price: 11.23 }
  }

  def self.find(code)
    PRODUCTS[code]
  end
end
