class AddCurrentsongToSongs < ActiveRecord::Migration
  def change
  	add_column :songs, :current_song, :boolean
  end
end
