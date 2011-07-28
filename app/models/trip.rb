class Trip < ActiveRecord::Base

  #Modellierung der Beziehungen
  belongs_to :user
  belongs_to :car
  has_many :ratings, :dependent => :destroy
  has_many :passengers, :dependent => :destroy
  has_many :users, :through => :passengers, :dependent => :destroy
  
  
  
  def to_s
    id 
  end

end
