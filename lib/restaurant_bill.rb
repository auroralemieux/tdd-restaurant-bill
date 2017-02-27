class RestaurantBill
  attr_reader :ordered_items

  def initialize
    @ordered_items = []
  end

  def order_item(item, cost)
    @ordered_items << [item, cost]
  end

  def sum_and_add_tax(tax_rate)
    sum = 0
    @ordered_items.each do |item|
      sum += item[1].to_f
    end
    total = sum + (sum * tax_rate).to_f
    total.round(2)
  end


end
