class UpdateRequestToReferenceSong < ActiveRecord::Migration
  def up
    change_table :requests do |t|
      t.remove :artist_id
      t.references :song
    end
  end

  def down
    
  end
end
