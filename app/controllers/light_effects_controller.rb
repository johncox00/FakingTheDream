class LightEffectsController < AdminController
  # GET /light_effects
  # GET /light_effects.json
  def index
    @light_effects = LightEffect.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @light_effects }
    end
  end

  # GET /light_effects/1
  # GET /light_effects/1.json
  def show
    @light_effect = LightEffect.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @light_effect }
    end
  end

  # GET /light_effects/new
  # GET /light_effects/new.json
  def new
    @light_effect = LightEffect.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @light_effect }
    end
  end

  # GET /light_effects/1/edit
  def edit
    @light_effect = LightEffect.find(params[:id])
  end

  # POST /light_effects
  # POST /light_effects.json
  def create
    @light_effect = LightEffect.new(params[:light_effect])

    respond_to do |format|
      if @light_effect.save
        format.html { redirect_to @light_effect, notice: 'Light effect was successfully created.' }
        format.json { render json: @light_effect, status: :created, location: @light_effect }
      else
        format.html { render action: "new" }
        format.json { render json: @light_effect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /light_effects/1
  # PUT /light_effects/1.json
  def update
    @light_effect = LightEffect.find(params[:id])

    respond_to do |format|
      if @light_effect.update_attributes(params[:light_effect])
        format.html { redirect_to @light_effect, notice: 'Light effect was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @light_effect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /light_effects/1
  # DELETE /light_effects/1.json
  def destroy
    @light_effect = LightEffect.find(params[:id])
    @light_effect.destroy

    respond_to do |format|
      format.html { redirect_to light_effects_url }
      format.json { head :no_content }
    end
  end
end
