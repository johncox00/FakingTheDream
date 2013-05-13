class Lightshow < ActiveRecord::Base
  attr_accessible :light_show_segments_attributes, :song
  has_many :light_show_segments
  belongs_to :song
  accepts_nested_attributes_for :light_show_segments

  EFFECT_OPTIONS = ["Random Color", "Specific Color", "BW Strobe", "Color Strobe", "Color Stream"]
end
