class Cart
  attr_reader :items
  attr_reader :total
  
  def initialize
    @items = []
  end
  
  def add_to_cart(book)
    @items << book
  end
  
  def clear
    @items.clear
  end
  
  def total_price
    @total = 0.00
    @items.each do |item|
	  @total = @total + item.price
	end
	return @total
  end

end