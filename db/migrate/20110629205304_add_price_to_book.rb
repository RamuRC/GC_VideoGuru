class AddPriceToBook < ActiveRecord::Migration
  def self.up
    add_column :books, :price, :decimal,
	  :precision => 8, :scale => 2, :default => 0
	add_column :books, :inventory, :integer, :default => 0
	remove_column :books, :num_pages
  end

  def self.down
    remove_column :books, :price
	remove_column :books, :inventory
  end
end
