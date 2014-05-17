require_relative 'cart'
class Bill
  def initialize(cart=nil)
    @cart = cart
  end

  def total
    0
  end

end
