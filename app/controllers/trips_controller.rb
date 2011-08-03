class TripsController < ApplicationController
  before_filter :authenticate_user!
  # GET /trips
  # GET /trips.json
  def index
    #Dummy. Wird entfernt
    temp = current_user
    @trips = temp.driven
    #Alle Fahrten, die ich als Fahrer noch absolvieren muss
    @future_trips = temp.to_drive
    #Alle Fahrten, die ich als Fahrer absolviert habe
    @completed_trips = temp.driven
    #Alle Fahrten, die ich als Mitfahrer absolviert habe
    @ridden_trips = temp.driven_with
    #Alle Fahrten, in denen ich Mitfahrer noch teilnehmen
    @future_ridden_trips = temp.to_drive_with
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @FAHRER = 0
    @MITFAHRER = 1
    @POTENTIELLER_MITFAHRER = 2
    @GAST = 3

    @user = current_user
    
    @trip = Trip.find(params[:id])
    if params[:request]
      current_user.bewerben(@trip)
    end
    @commited_passenger = @trip.get_committed_passengers
    @uncommited_passenger = @trip.get_uncommitted_passengers
    @free_seats = @trip.get_free_seats
    @occupied_seats = @trip.get_occupied_seats
    if current_user == @trip.user
      flash[:notice] = "FAHRER"
      @status = @FAHRER
    elsif @trip.user_committed (current_user)
      flash[:notice] = "MITFAHRER"
      @status = @MITFAHRER
    elsif @trip.user_uncommitted (current_user)
      flash[:notice] = "POTENTIELLER_MITFAHRER"
      @status = @POTENTIELLER_MITFAHRER
    else
      flash[:notice] = "GAST"
      @status = @GAST
    end
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  def new
    @trip = Trip.new
    @fahrzeuge = current_user.cars

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
  end

  # POST /trips
  # POST /trips.json
  def create
    #Die eingehenden Daten empfangen und an eine Methode übergeben, die ein Array an möglichen Orten zurückgeben
    #Redirecten mit Parametern? An die new Action?

    #@trip = Trip.new(params[:trip])
    @trip = Trip.new()
    @trip.user_id = current_user.id
    @trip.car_id = params[:car]
    temp = Geocoder.coordinates(params[:address_start])
    @trip.starts_at_N = temp[0]
    @trip.starts_at_E = temp[1]
    temp = Geocoder.coordinates(params[:address_end])
    @trip.ends_at_N = temp[0]
    @trip.ends_at_E = temp[1]
    @trip.address_start = params[:address_start]
    @trip.address_end = params[:address_end]
    @trip.start_time = params[:date_start]+"T"+params[:time_start]+"Z"
    temp = Car.find(params[:car])
    if params[:free_seats] == ""
      @trip.free_seats = temp.seats
    else
      @trip.free_seats = params[:free_seats]
    end
    @trip.set_route
    @trip.baggage = true

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render json: @trip, status: :created, location: @trip }
      else
        format.html { redirect_to root_path }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])
    if params[:request]
      current_user.bewerben(@trip)
    end

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :ok }
    end
  end
end

