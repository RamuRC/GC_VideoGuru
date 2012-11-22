class TitlesUsers < ActiveRecord::Migration
  def self.up
    create_table :titles_users, :id => false do |t|
			t.references :title
			t.references :user
			t.string :rating
			t.timestamps
		end
  end

  def self.down
    drop_table :titles_users
  end
end