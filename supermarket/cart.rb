require_relative 'cart_item'
class Cart
  attr_reader :items
  def initialize
    @items = []
  end

  def add(cart_item)
   @items << cart_item if cart_item 
  end

end
