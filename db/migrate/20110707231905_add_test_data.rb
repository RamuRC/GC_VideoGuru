class AddTestData < ActiveRecord::Migration
  def self.up
  Author.destroy_all
  Book.destroy_all
  Order.destroy_all
  User.destroy_all
  
  isaac = Author.create(:first_name => "Isaac", :last_name => "Asimov")
  george = Author.create(:first_name => "George", :last_name => "Orwell")
  venkat = Author.create(:first_name => "Venkat", :last_name => "Subramaniam")
  dosto = Author.create(:first_name => "Fyodor", :last_name => "Dostoevsky")
  
  prog1 = Book.create(:title => "Practices of an Agile Developer",
                  :publisher => "Pragmatic Bookshelf",
				  :inventory => 25,
                  :image_url => "/images/Lighthouse.jpg",
                  :price => 29.95)
  prog1.authors << venkat
				  
  prog2 = Book.create(:title => "Programming Groovy",
                  :publisher => "Pragmatic Bookshelf",
				  :inventory => 10,
                  :image_url => "/images/Koala.jpg",
                  :price => 19.95)
  prog2.authors << venkat
  
  nine = Book.create(:title => "1984",
                  :publisher => "Penguin Classics",
				  :inventory => 50,
                  :image_url => "/images/Jellyfish.jpg",
                  :price => 14.99)
  nine.authors << george
  nine.authors << isaac
  
  animal = Book.create(:title => "Animal Farm",
                  :publisher => "Penguin Classics",
				  :inventory => 25,
                  :image_url => "/images/Desert.jpg",
                  :price => 29.95)
  animal.authors << george
  
  brother = Book.create(:title => "The Brothers Karamazov",
                  :publisher => "Barnes and Noble Classics",
				  :inventory => 15,
                  :image_url => "/images/Chrysanthemum.jpg",
                  :price => 29.95)
  brother.authors << dosto
  
  crime = Book.create(:title => "Crime and Punishment",
                  :publisher => "Barnes and Noble Classics",
				  :inventory => 25,
                  :image_url => "/images/Lighthouse.jpg",
                  :price => 29.95)
  crime.authors << dosto
  crime.authors << george
				  
  user1 = User.create(:name => "admin",
                :email => "admin@hotmail.com",
				:password => "password",
				:address_line => "456 Another St",
				:city => "Houston",
				:state => "TX",
				:zipcode => 77807)
  user1.toggle!(:admin)				
				
  User.create(:name => "Owais Ahmed",
                :email => "owais@hotmail.com",
				:password => "password",
				:address_line => "123 Random St",
				:city => "Houston",
				:state => "TX",
				:zipcode => 78705)
				
  User.create(:name => "Jerry Seinfeld",
                :email => "jerry@hotmail.com",
				:password => "password",
				:address_line => "789 New St",
				:city => "New York",
				:state => "NY",
				:zipcode => 73465)
  
  end

  def self.down
    Author.destroy_all
    Book.destroy_all
    Order.destroy_all
    User.destroy_all
  end
  
end