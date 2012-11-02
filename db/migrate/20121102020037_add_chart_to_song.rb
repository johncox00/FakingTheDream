class AddChartToSong < ActiveRecord::Migration
  def change
    add_column :songs, :chart, :text
  end
end
