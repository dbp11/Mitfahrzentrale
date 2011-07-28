class Trip < ActiveRecord::Base

  #Modellierung der Beziehungen
  belongs_to :user, class_name =>"User", :as => "driver_trip"
  belongs_to :car
  has_many :ratings
  has_many :passengers
  has_many :users, class_name => "User", :as => "passenger_trip", :through => :passengers
  
  def to_s
    id 
  end
  
end
