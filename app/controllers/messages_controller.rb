class MessagesController < ApplicationController
  before_filter :authenticate_user!
  # GET /messages
  # GET /messages.json
  def index
    temp = User.find(current_user.id)
    @messages = Message.all
    #Hier Methode einfügen, nur eigene Nachrichten

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  def outbox
    @messages = Message.all
    #Hier Methode, nur empfangene
  
    respond_to do |format|
      format.html # index.html.haml
      format.json  { render :json => @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new
    temp = User.find(params[:id])
    @message.receiver = temp
	  @message.writer = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])
	if params[:who] == "receiver"
		@message.delete_receiver = true
	elsif
		@message.delete_writer = true
	end
	if @message.delete_receiver and @message.delete_writer
	   @message.destroy
	end

    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully deleted.' }
      format.json { head :ok }
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :ok }
    end
  end
end
