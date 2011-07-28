class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])

  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
  def edit_profil
    @user = current_user
  end


  # PUT /users/1
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:trip])
      redirect_to @user, notice: 'Trip was successfully updated.' 
    else
      render action: "edit" 
    end
  end
end
