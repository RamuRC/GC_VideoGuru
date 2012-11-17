class Title < ActiveRecord::Base
attr_accessible :inventory, :movie_name, :publisher, :price, :image_url

  has_and_belongs_to_many :authors
  validates_uniqueness_of :id
  validates_uniqueness_of :movie_name, :scope => :publisher
  validates_presence_of :movie_name, :inventory, :price, :image_url, :publisher
  validates_numericality_of :price
  validates_numericality_of :inventory, :only_integer => true
  validates_format_of :image_url,
    :with		=> %r{\.(gif|jpg|png)$}i,
    :message	=> "must be a URL for a GIF, JPG, or PNG image"
  
  def decr_inventory(quantity)
    self.inventory = self.inventory - quantity
	redirect_to :controller => 'shop', :action => 'index' unless self.save
  end
  
  protected
  def validate
    errors.add(:price, "should be at least $0") if price.nil? || price < 0
  end
  
  def self.find_books_for_sale
    find(:all, :order => "movie_name")
  end
  
  # Searches for titles when called from the controller using like
  def self.search(query)
    movie_name = query.to_s.gsub(/%/,"\%")
	books_arr = []
	books_arr << Title.find_by_title(movie_name) unless Title.find_by_title(movie_name) == nil
	movie_name.split(' ').each do |i|
	  books1 = Title.find(:all, :conditions => ["movie_name like ?", "%#{i}%"])
	  books1.each do |title|
		books_arr << title unless books_arr.include?(title)
	  end
	end
	return books_arr
  end

end
