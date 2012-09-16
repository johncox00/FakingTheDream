class ReverseSongsTags < ActiveRecord::Migration
  def up
  	drop_table :tags_songs
  	create_table :songs_tags, :id => false do |t|
  		t.integer :tag_id
  		t.integer :song_id
  	end
  end

  def down
  	drop_table :songs_tags
  end
end
