class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.references :user
	  t.integer :status		# 0: Order not placed; 1: Order placed; 2: Order shipped
	  t.integer :per_order_id   # Each item will be stored individually in the database; items from the same order will share an order_id
	  t.string :book_title
	  t.decimal :price
	  
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
