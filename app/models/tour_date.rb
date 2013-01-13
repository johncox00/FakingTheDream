class TourDate < ActiveRecord::Base
  belongs_to :venue
  attr_accessible :age_restrictions, :cover, :date_time, :notes, :venue_id
end
