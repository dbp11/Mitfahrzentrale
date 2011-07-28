class Trip < ActiveRecord::Base

  #Modellierung der Beziehungen
  belongs_to :user
  belongs_to :car
  has_many :ratings
  has_many :passengers
  has_many :users, :class_name => "User", :as => "passenger_trip", :through => :passengers, :source => :user
  
  def to_s
    id 
  end
  
end
