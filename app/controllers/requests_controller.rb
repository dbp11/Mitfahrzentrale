class RequestsController < ApplicationController
  before_filter :authenticate_user!
  # GET /requests
  # GET /requests.json
  def index
    temp = current_user.id
    # Auf Methode warten, nur noch offene, in der Zukunft liegende Requests 
    @requests = Request.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])
    #@sorted_trips = @request.get_sorted_trips

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.json
  def new
    @request = Request.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
  end

  # POST /requests
  # POST /requests.json
  def create
    #@request = Request.new(params[:request])
    start = Geocoder.coordinates(params[:address_start])
    ende = Geocoder.coordinates(params[:address_end])
    @request = Request.new()
    @request.user_id = current_user.id
    @request.starts_at_N = start[0]
    @request.starts_at_E = start[1]
    @request.ends_at_N = ende[0]
    @request.ends_at_E = ende[1]
    @request.address_start = params[:address_start]
    @request.address_end = params[:address_end]
    @request.start_time = params[:date_start]+"T"+params[:time_start]+"Z"
    @request.end_time = params[:date_end]+"T"+params[:time_end]+"Z"
    if params[:baggage] == nil
      @request.baggage = false
    else
      @request.baggage = true
    end
    #@request.start_radius = params[:start_radius]
    #@request.end_radius = params[:end_radius]
    @request.end_radius = 10
    @request.start_radius = 10
    #Radius noch implementieren, dann die Dummy Felder rausnehmen
    @request.set_route
    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render json: @request, status: :created, location: @request }
      else
        format.html { redirect_to root_path, notice: 'FEHLER' }
        #format.html { render action: "new" }
        #format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.json
  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :ok }
    end
  end
end
