class TourDatesController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:show, :index]

  # GET /tour_dates
  # GET /tour_dates.json
  def index
    @tour_dates = TourDate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tour_dates }
    end
  end

  # GET /tour_dates/1
  # GET /tour_dates/1.json
  def show
    @tour_date = TourDate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tour_date }
    end
  end

  # GET /tour_dates/new
  # GET /tour_dates/new.json
  def new
    @tour_date = TourDate.new
    @venues = Venue.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tour_date }
    end
  end

  # GET /tour_dates/1/edit
  def edit
    @tour_date = TourDate.find(params[:id])
  end

  # POST /tour_dates
  # POST /tour_dates.json
  def create
    @tour_date = TourDate.new(params[:tour_date])

    respond_to do |format|
      if @tour_date.save
        format.html { redirect_to @tour_date, notice: 'Tour date was successfully created.' }
        format.json { render json: @tour_date, status: :created, location: @tour_date }
      else
        format.html { render action: "new" }
        format.json { render json: @tour_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tour_dates/1
  # PUT /tour_dates/1.json
  def update
    @tour_date = TourDate.find(params[:id])

    respond_to do |format|
      if @tour_date.update_attributes(params[:tour_date])
        format.html { redirect_to @tour_date, notice: 'Tour date was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tour_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_dates/1
  # DELETE /tour_dates/1.json
  def destroy
    @tour_date = TourDate.find(params[:id])
    @tour_date.destroy

    respond_to do |format|
      format.html { redirect_to tour_dates_url }
      format.json { head :no_content }
    end
  end
end
