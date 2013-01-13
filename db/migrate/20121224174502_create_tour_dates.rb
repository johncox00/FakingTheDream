class CreateTourDates < ActiveRecord::Migration
  def change
    create_table :tour_dates do |t|
      t.references :venue
      t.datetime :date_time
      t.float :cover
      t.string :age_restrictions
      t.text :notes

      t.timestamps
    end
    add_index :tour_dates, :venue_id
  end
end
