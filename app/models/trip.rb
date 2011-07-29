

class Trip < ActiveRecord::Base

#Modellierung der Beziehungen
  belongs_to :user
  belongs_to :car 
  has_many :users, :class_name => "User", :as => "passenger_trip", :through => :passengers, :source => :user, :dependent => :destroy
  has_many :ratings, :dependent => :destroy
  has_many :passengers, :dependent => :destroy
  
  #Methoden:
  #toString Methode für Trips
  def to_s
    id 
  end
  

  def get_commited_passengers  
    erg []
    self.passengers.each do |x|
      if x.commited? 
        erg = erg << x.user_id
      end
    end
    return erg
  end

  def get_uncommited_passengers
     erg []
     self.passengers.each do |x|
      if x.commited? 
        erg = erg << x.user_id
      end
     end
     return erg
  end  
end
