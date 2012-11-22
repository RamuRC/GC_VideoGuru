class CreateTitles < ActiveRecord::Migration
  def self.up
    create_table :titles do |t|
			t.string   :movie_name
			t.string   :director
			t.string   :image_url
			t.string   :video_url
			t.integer   :rating
    end
  end

  def self.down
    drop_table :titles
  end
end
