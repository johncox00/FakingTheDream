class AddFacebookEventToTourDate < ActiveRecord::Migration
  def change
    add_column :tour_dates, :facebook_event_url, :string
  end
end
