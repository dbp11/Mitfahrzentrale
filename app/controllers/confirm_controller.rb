class ConfirmController < ApplicationController
  def request
    flash[:notice] = "Test"
    temp = current_user
    trip = params[:id]
    #temp.bewerben(trip)

    redirect_to root_path
    


  end

end
