class AdminController < ApplicationController
	layout 'admin'

	def dashboard
    authenticate_user!
	  @songs = Song.find(:all, :order => :title)
    yesterday = Date.today - 1
    tomorrow = Date.today + 1
    @requests = Request.find(:all, :order => :created_at)
    @grouped_requests = Request.joins(:song).where(:requests => {:created_at => yesterday...tomorrow}).select("songs.title as title, request.count as requests, request.song_id as song_id").order("count ASC")
	end

	def set_current_song
 	  old_currents = Song.where(:current_song => true)
 	  old_currents.each do |s|
 	  	s.current_song = false
 	  	s.save
 	  end
 	  id = params[:id].to_i
 	  if id > 0 
 	    new_current = Song.find(id)
 	    new_current.current_song = true
 	    new_current.save
 	  else
 	  	new_current = {:title => "(silence)", :lyric => "We're taking 5. BRB."}
 	  end
    broadcast "/songs/current", new_current
 	  respond_to do |format|
	     format.json { render json: new_current }
	   end
	end

  def ignore_request
    respond_to do |format|
      format.json { render json: Request.find(params[:request_id]).destroy }
    end
  end

  def get_requests_grouped_by_song
    yesterday = Date.today - 1
    tomorrow = Date.today + 1
    grouped_requests = Request.where(:created_at => yesterday...tomorrow).select("song.title as title, count as requests, song.id as song_id").order("count ASC")
    respond_to do |format|
      format.json { render json: grouped_requests }
      format.html { render partial: "most_popular_requests", locals: {grouped_requests: grouped_requests}}
    end
  end

  def delete_requests_by_song
    respond_to do |format|
      format.json { render json: Request.destroy_all(:song_id => params[:song_id]) }
    end
  end

  def broadcast(channel, data)
    puts "BROCASTING NOW!"
    message = {:channel => channel, :data => data, :ext => {:auth_token => FAYE_TOKEN}}
    uri = URI.parse("http://ftd-rt.herokuapp.com/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end 
