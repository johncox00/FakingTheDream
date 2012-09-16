class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.text :lyric
      t.references :artist

      t.timestamps
    end
    add_index :songs, :artist_id
  end
end
