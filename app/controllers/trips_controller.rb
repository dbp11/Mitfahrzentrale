class TripsController < ApplicationController
  # GET /trips
  # GET /trips.json
  def index
    #Dummy. Wird entfernt
    temp = current_user
    @trips = temp.driven
    #Alle Fahrten, die ich als Fahrer noch absolvieren muss
    @future_trips = temp.driven
    #Alle Fahrten, die ich als Fahrer absolviert habe
    @completed_trips = temp.to_drive
    #Alle Fahrten, in denen ich Mitfahrer war
    @ridden_trips = temp.driven_with
    #driven_with und to_drive_with funktioniert noch nicht -> undefined local variable or method `passenger_trip'
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
    @trip = Trip.find(params[:id])
    
    @commited_passenger = @trip.get_commited_passengers.all
    @uncommited_passenger = @trip.get_uncommited_passengers.all
    @free_seats = @trip.get_free_seats
    
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
    flash[:notice] = params[:temp]

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
    @trip = Trip.new(params[:trip])
     
    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render json: @trip, status: :created, location: @trip }
      else
        format.html { render action: "new" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])

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
