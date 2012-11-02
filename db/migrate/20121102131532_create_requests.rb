class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :requestor
      t.references :artist
      t.timestamps
    end
  end
end
