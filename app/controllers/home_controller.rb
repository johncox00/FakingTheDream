class HomeController < ApplicationController
  def index
    @songs = Song.all
  end

  def songlist
    @songs = Song.find(:all, :order => :title)
  end

  def song
  	@song = Song.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

  def current
    @current_song = Song.where(:current_song => true).first
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @current_song }
    end    
  end

  def get_current_song_id
  	cs = Song.where(:current_song => true)
  	if cs.length > 0
      cs = {:id => cs.first.id}.to_json
    else
      cs = {:id => -1}.to_json
  	end
  	respond_to do |format|
      format.json { render json: cs }
    end    
  end

  def create_request
    request = Request.create(song_id: params[:song_id], requestor: params[:requestor])
    respond_to do |format|
      format.json { render json: request }
    end
  end

  def dates; end
end
