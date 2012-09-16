class AdminController < ApplicationController
	layout 'admin'

	def dashboard
	  @songs = Song.all
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
end
