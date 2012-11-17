class AddShippingAddressToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :address_line, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zipcode, :string
  end

  def self.down
    remove_column :users, :zipcode
    remove_column :users, :state
    remove_column :users, :city
    remove_column :users, :address_line
  end
end
