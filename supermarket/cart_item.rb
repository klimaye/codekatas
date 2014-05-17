require_relative 'product'
require_relative 'unit'
class CartItem

  attr_reader :product,:amount
  def initialize(details={})
    @product  = details[:product]
    @amount   = details[:amount]
  end

  def product_price
    @product.price
  end

  def product_name
    @product.name
  end

  def product_unit
    @product.unit
  end

  def product_sold_by
    @product.sold_by
  end
end
