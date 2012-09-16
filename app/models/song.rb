class Song < ActiveRecord::Base
  belongs_to :artist
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :genres
  attr_accessible :lyric, :title, :current_song, :artist
end
