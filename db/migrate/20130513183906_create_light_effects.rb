class CreateLightEffects < ActiveRecord::Migration
  def change
    create_table :light_effects do |t|
      t.string :name
      t.string :meta

      t.timestamps
    end
  end
end
