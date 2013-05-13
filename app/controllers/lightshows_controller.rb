class LightshowsController < AdminController
  # GET /lightshows
  # GET /lightshows.json
  before_filter :authenticate_user!

  def index
    @lightshows = Lightshow.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lightshows }
    end
  end

  # GET /lightshows/1
  # GET /lightshows/1.json
  def show
    @lightshow = Lightshow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lightshow }
    end
  end

  # GET /lightshows/new
  # GET /lightshows/new.json
  def new
    @lightshow = Lightshow.new
    @songs = Song.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lightshow }
    end
  end

  # GET /lightshows/1/edit
  def edit
    @lightshow = Lightshow.find(params[:id])
  end

  # POST /lightshows
  # POST /lightshows.json
  def create
    @song = Song.find(params[:lightshow].delete(:song))
    @lightshow = Lightshow.new(params[:lightshow])
    @lightshow.song = @song
    respond_to do |format|
      if @lightshow.save
        format.html { redirect_to @lightshow, notice: 'Lightshow was successfully created.' }
        format.json { render json: @lightshow, status: :created, location: @lightshow }
      else
        format.html { render action: "new" }
        format.json { render json: @lightshow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lightshows/1
  # PUT /lightshows/1.json
  def update
    @lightshow = Lightshow.find(params[:id])
    @song = Song.find(params[:lightshow].delete(:song_id))
    @lightshow.song = @song
    @lightshow.save!
    respond_to do |format|
      if @lightshow.update_attributes(params[:lightshow])
        format.html { redirect_to @lightshow, notice: 'Lightshow was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lightshow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lightshows/1
  # DELETE /lightshows/1.json
  def destroy
    @lightshow = Lightshow.find(params[:id])
    @lightshow.destroy

    respond_to do |format|
      format.html { redirect_to lightshows_url }
      format.json { head :no_content }
    end
  end
end
