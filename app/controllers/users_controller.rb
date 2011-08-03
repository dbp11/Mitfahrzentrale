class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])

  end

  #GET /users/1/edit_profil
  def edit_profil
    @user = User.find(params[:id])
  end


  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end


  # PUT /users/1
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
      format.html { redirect_to @user, notice: 'User was successfully updated.' }
      format.json { head :ok }
    else
      render action: "edit" 
    end
    end
  end
end
