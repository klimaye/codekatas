require_relative 'cart'

class StrategyBillCalculator

  def initialize(cart, config={})
    @cart                 = cart
    @product_for          = config[:product]
    @qualifying_criteria  = config[:qualifying_criteria]
    @qualifying_price     = config[:qualifying_price]
    @regular_price        = config[:regular_price]
  end

  def applicable?
    puts "applicable item count = #{applicable_items.count}"
    qualifying_amount, non_qualifying_amount = @qualifying_criteria.call applicable_items
    puts "#{qualifying_amount}, #{non_qualifying_amount}"
    qualifying_amount > 0
  end

  def qualifying_item_total(amount)
    @qualifying_price * amount
  end

  def regular_item_total(amount)
    @regular_price * amount
  end

  def total
    qualifying_amount, remainder_amount  =
      @qualifying_criteria.call applicable_items
    qualifying_item_total(qualifying_amount) + regular_item_total(remainder_amount)
  end

  private
  def applicable_items
    product_cart_items = @cart.items.find_all { |item| item.product == @product_for }
    product_cart_items
  end
end
