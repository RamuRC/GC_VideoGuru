class User < ActiveRecord::Base
  has_and_belongs_to_many :titles

  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation, :address_line, :city, :state, :zipcode
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates_presence_of :name, :email, :password, :address_line, :city, :state, :zipcode
  validates_confirmation_of :password
  validates_uniqueness_of :email, :case_sensitive => false
  validates_length_of :name, :within => 3..20
  validates_length_of :password, :within => 8..20
  validates_numericality_of :zipcode
  validates_format_of :email, :with => email_regex
  validates_format_of :name, :city, :state, :with => /\A([A-Za-z\s\'\.-]*)\Z/
  
  before_save :encrypt_password
  
  # Return true if the user's password matches the submitted password.
  def has_password?(submitted_password)
    # Compare encrypted_password with the encrypted version of
    # submitted_password.
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
  
  private

	def encrypt_password
		self.salt = make_salt if new_record?
		self.encrypted_password = encrypt(password)
	end

	def encrypt(string)
		secure_hash("#{salt}--#{string}")
	end

	def make_salt
		secure_hash("#{Time.now.utc}--#{password}")
	end

	def secure_hash(string)
		Digest::SHA2.hexdigest(string)
	end
end
