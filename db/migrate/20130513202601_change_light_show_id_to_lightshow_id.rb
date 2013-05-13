class ChangeLightShowIdToLightshowId < ActiveRecord::Migration
  def up
    add_column :light_show_segments, :lightshow_id, :integer
    remove_column :light_show_segments, :light_show_id
  end

  def down
  end
end
