class LightShowSegmentsController < AdminController
  # GET /light_show_segments
  # GET /light_show_segments.json
  before_filter :authenticate_user!
  
  def index
    @light_show_segments = LightShowSegment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @light_show_segments }
    end
  end

  # GET /light_show_segments/1
  # GET /light_show_segments/1.json
  def show
    @light_show_segment = LightShowSegment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @light_show_segment }
    end
  end

  # GET /light_show_segments/new
  # GET /light_show_segments/new.json
  def new
    @light_show_segment = LightShowSegment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @light_show_segment }
    end
  end

  # GET /light_show_segments/1/edit
  def edit
    @light_show_segment = LightShowSegment.find(params[:id])
  end

  # POST /light_show_segments
  # POST /light_show_segments.json
  def create
    @light_show_segment = LightShowSegment.new(params[:light_show_segment])

    respond_to do |format|
      if @light_show_segment.save
        format.html { redirect_to @light_show_segment, notice: 'Light show segment was successfully created.' }
        format.json { render json: @light_show_segment, status: :created, location: @light_show_segment }
      else
        format.html { render action: "new" }
        format.json { render json: @light_show_segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /light_show_segments/1
  # PUT /light_show_segments/1.json
  def update
    @light_show_segment = LightShowSegment.find(params[:id])

    respond_to do |format|
      if @light_show_segment.update_attributes(params[:light_show_segment])
        format.html { redirect_to @light_show_segment, notice: 'Light show segment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @light_show_segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /light_show_segments/1
  # DELETE /light_show_segments/1.json
  def destroy
    @light_show_segment = LightShowSegment.find(params[:id])
    @light_show_segment.destroy

    respond_to do |format|
      format.html { redirect_to light_show_segments_url }
      format.json { head :no_content }
    end
  end
end
