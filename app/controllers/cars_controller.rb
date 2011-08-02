class CarsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /cars
  # GET /cars.json
  def index
    temp = current_user
    @cars = temp.cars
    authorize! :show, :car

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cars }
    end
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    @car = Car.find(params[:id])
    authorize! :show, :car

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @car }
    end
  end

  # GET /cars/new
  # GET /cars/new.json
  def new
    @car = Car.new
    authorize! :create, :car

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @car }
    end
  end

  # GET /cars/1/edit
  def edit
    @car = Car.find(params[:id])
    authorize! :update, @car
  end


  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(params[:car])
    authorize! :create, :car
    temp = current_user.id
    @car.user_id = temp

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render json: @car, status: :created, location: @car }
      else
        format.html { render action: "new" }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cars/1
  # PUT /cars/1.json
  def update
    @car = Car.find(params[:id])
    authorize! :update, @car

    respond_to do |format|
      if @car.update_attributes(params[:car])
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car = Car.find(params[:id])
    authorize! :delete, @car
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url }
      format.json { head :ok }
    end
  end
end
