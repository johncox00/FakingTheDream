class AddStartShowToSong < ActiveRecord::Migration
  def change
    add_column :songs, :start_light_show, :boolean
  end
end
