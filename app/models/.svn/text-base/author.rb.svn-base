class Author < ActiveRecord::Base
  has_and_belongs_to_many :books
  validates_uniqueness_of :id
  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :first_name, :scope => :last_name
  validates_length_of :first_name, :last_name, :within => 2..20
  validates_format_of :first_name, :last_name, :with => /\A([A-Za-z\'\.-]*)\Z/
  
    # Searches for authors when called from controller using split and like
  def self.search(query)
    name = []
	name = query.to_s.gsub(/%/,"\%").split(" ")
	authors_arr = []
	authors_arr << Author.find_by_first_name_and_last_name(name[0], name[1]) unless Author.find_by_first_name_and_last_name(name[0], name[1]) == nil
	name.each do |i|
	  authors1 = Author.find(:all, :conditions => ["first_name like ?", "%#{i}%"])
	  authors1.each do |author|
		authors_arr << author unless authors_arr.include?(author)
	  end
	  authors1 = Author.find(:all, :conditions => ["last_name like ?", "%#{i}%"])
	  authors1.each do |author|
		authors_arr << author unless authors_arr.include?(author)
	  end
	end
	return authors_arr
  end
  
end
