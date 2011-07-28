class Passenger < ActiveRecord::Base

  #Beziehungen  
  belongs_to :user
  belongs_to :trip


end
