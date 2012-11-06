class AdminController < ApplicationController
	layout 'admin'

	def dashboard
	  @songs = Song.find(:all, :order => :title)
    yesterday = Date.today - 1
    tomorrow = Date.today + 1
    @requests = Request.find(:all, :order => :created_at)
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
    end
  end

  def delete_requests_by_song
    respond_to do |format|
      format.json { render json: Request.destroy_all(:song_id => params[:song_id]) }
    end
  end
end 
