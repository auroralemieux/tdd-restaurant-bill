require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/restaurant_bill'


describe RestaurantBill do

  before do
    @my_bill = RestaurantBill.new
  end

  it "A bill is created with an empty ordered_items" do
    @my_bill.ordered_items.must_be_instance_of Array
    @my_bill.ordered_items.empty?.must_equal true
  end

  it "after running order_item the ordered_items array should include the new item" do
    @my_bill.ordered_items.length.must_equal 0
    @my_bill.order_item("pancake", 12.99)
    @my_bill.ordered_items.length.must_equal 1
    @my_bill.ordered_items[0].class.must_equal Array
  end

  it "after ordering 3 things the array should have a length of 3" do
    @my_bill.ordered_items.length.must_equal 0
    @my_bill.order_item("pancake", 12.99)
    @my_bill.order_item("gravyballs", 77.01)
    @my_bill.order_item("ice cream", 1.00)
    @my_bill.ordered_items.length.must_equal 3
    @my_bill.ordered_items[0].class.must_equal Array
  end

  it "totals plus tax" do
    @my_bill.order_item("pancake", 3)
    @my_bill.order_item("pancake", 4)
    @my_bill.order_item("pancake", 7)
    @my_bill.sum_and_add_tax(0.096).must_equal 15.34
  end

  it "allows adding tip" do
    @my_bill.order_item("pancake", 3)
    @my_bill.order_item("pancake", 4)
    @my_bill.sum_and_add_tax(0.096)
    @my_bill.add_tip(2.00).must_equal 9.67
  end

end
