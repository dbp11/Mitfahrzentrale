class Request < ActiveRecord::Base

  #Beziehungen
  belongs_to :user

  def get_similar_trips
    #geocoder...
  end

end
