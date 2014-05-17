class Product
  QUANTITY = 1
  WEIGHT = 2
  attr_reader :name, :sold_by, :price, :unit
  def initialize(config={})
    @name     = config[:name] || 'NOT SET'
    @sold_by  = config[:sold_by]
    @price    = config[:price] || 0.00
    @unit     = config[:unit] if @sold_by == WEIGHT
  end

  def ==(another_product)
    self.name == another_product.name
  end
end

