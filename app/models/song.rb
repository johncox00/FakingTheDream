class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :requests
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :genres
  has_one :lightshow
  attr_accessible :lyric, :title, :current_song, :artist, :artist_id, :chart


end
