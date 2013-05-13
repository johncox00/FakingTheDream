class AddTextColorToLightshowSegment < ActiveRecord::Migration
  def change
    add_column :light_show_segments, :text_color, :string
  end
end
