class Title < ActiveRecord::Base
	has_and_belongs_to_many :users
	# attr_accessible :inventory, :movie_name, :publisher, :price, :image_url
	attr_accessible :movie_name, :director, :image_url, :video_url, :rating

  validates_uniqueness_of :id
  validates_uniqueness_of :movie_name, :scope => :director
  validates_presence_of :movie_name, :director, :image_url, :video_url
  validates_numericality_of :rating
  # validates_numericality_of :inventory, :only_integer => true
  validates_format_of :image_url,
    :with		=> %r{\.(gif|jpg|png)$}i,
    :message	=> "must be a URL for a GIF, JPG, or PNG image"
	validates_format_of :video_url,
    :with		=> %r{\.(webm)$}i,
    :message	=> "must be a URL for a WEBM video"
  
  # def decr_inventory(quantity)
    # self.inventory = self.inventory - quantity
	# redirect_to :controller => 'shop', :action => 'index' unless self.save
  # end
  
  protected
  def validate
    errors.add(:rating, "should be between 1 and 5") if rating.nil? || rating < 0 || rating > 5
  end
  
  # def self.find_books_for_sale
	def self.find_titles_for_sale
    find(:all, :order => "movie_name")
  end
  
  # Searches for titles when called from the controller using like
  def self.search(query)
    movie_name = query.to_s.gsub(/%/,"\%")
		movies_arr = []
		movies_arr << Title.find_by_title(movie_name) unless Title.find_by_title(movie_name) == nil
		movie_name.split(' ').each do |i|
			movies1 = Title.find(:all, :conditions => ["movie_name like ?", "%#{i}%"])
			movies1.each do |title|
				movies_arr << title unless movies_arr.include?(title)
			end
		end
		return movies_arr
  end

end
