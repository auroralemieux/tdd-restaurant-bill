class RestaurantBill
  attr_reader :ordered_items, :total

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
    @total = sum + (sum * tax_rate).to_f
    @total.round(2)
  end

  def add_tip(tip_amount)
    @total += tip_amount
    @total.round(2)
  end


end
#
# bill = RestaurantBill.new
# bill.order_item("food", 3)
# bill.order_item("pig ears", 4.5)
# puts bill.total
#
# bill.sum_and_add_tax(0.096)
# puts bill.total
#
# bill.add_tip(2)
# puts bill.total
