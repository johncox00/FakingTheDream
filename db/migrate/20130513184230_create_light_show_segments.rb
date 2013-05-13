class CreateLightShowSegments < ActiveRecord::Migration
  def change
    create_table :light_show_segments do |t|
      t.string :effect
      t.integer :duration
      t.integer :sort_order
      t.string :text
      t.integer :strobe_duration
      t.string :color_hex
      t.integer :light_show_id

      t.timestamps
    end
  end
end
