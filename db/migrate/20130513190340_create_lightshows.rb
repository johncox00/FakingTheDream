class CreateLightshows < ActiveRecord::Migration
  def change
    create_table :lightshows do |t|
      t.integer :song_id
      t.timestamps
    end
  end
end
