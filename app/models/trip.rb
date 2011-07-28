class Trip < ActiveRecord::Base

  #Modellierung der Beziehungen
  belongs_to :user
  belongs_to :car
<<<<<<< HEAD
  has_many :ratings
  has_many :passengers
  has_many :users, :class_name => "User", :as => "passenger_trip", :through => :passengers, :source => :user
=======
  has_many :ratings, :dependent => :destroy
  has_many :passengers, :dependent => :destroy
  has_many :users, :through => :passengers, :dependent => :destroy
  
  
>>>>>>> de8be3895514e44fac32d9014c23bcbbcfdaeed1
  
  def to_s
    id 
  end
  
end
