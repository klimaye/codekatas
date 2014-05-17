require 'ostruct'
require_relative 'cart'
require_relative 'cart_item'

class BasicBillCalculator

  def initialize(cart=nil, config={})
    @cart = cart
    @strategy = lambda { |item| item.product_price * item.amount }
  end

  def applicable?
    !applicable_items.empty?
  end

  def total_by_item
    item_totals = []
    applicable_items.each do |cart_item|
      item_totals << OpenStruct.new(item: cart_item, total: @strategy.call(cart_item))
    end
    item_totals
  end

  def total
    total = 0.0
    applicable_items.each do |cart_item|
      total += @strategy.call cart_item
    end
    total
  end

  private
  def applicable_items
    @cart.items
  end

end
