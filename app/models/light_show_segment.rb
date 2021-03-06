class LightShowSegment < ActiveRecord::Base
  attr_accessible :color_hex, :duration, :effect, :sort_order, :strobe_duration, :text, :text_color
  belongs_to :lightshow
  default_scope order('sort_order ASC')
end
