class Order < ActiveRecord::Base
  belongs_to :user
  
  def incr_quantity
    self.quantity = self.quantity + 1
	redirect_to :controller => 'shop', :action => 'index' unless self.save
  end
  
  def ship_status
    self.status = 2
	self.save
  end
end
