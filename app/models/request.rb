class Request < ActiveRecord::Base
  belongs_to :song
  attr_accessible :requestor, :song, :created_at, :song_id
end
