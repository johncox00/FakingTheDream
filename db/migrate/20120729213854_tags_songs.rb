class TagsSongs < ActiveRecord::Migration
  def up
  	create_table :tags_songs, :id => false do |t|
  		t.integer :tag_id
  		t.integer :song_id
  	end
  end

  def down
  	drop_table :tags_songs
  end
end
