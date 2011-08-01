# encoding: utf-8

class Car < ActiveRecord::Base
  
  #Beziehung: user_has_cars
  belongs_to :user

  #Kontrolle ob das Kennzeichen eine Gülitige Länge hat
  validates :licence, :uniqueness => true, :presence => true, :length => {:minimum => 1}
  
  validates_presence_of :seats, :licence, :description 

  has_attached_file :carpic, :styles => { :medium =>  "300x300>", :thumb => "100x100>"}

  #to String Methode für Cars
  def to_s
    "Besitzer: " + user + "\n" +
    "Typ:" + description + "\n" +
    "Plätze: " + seats + "\n" +
    "Kofferraum: " + trunk + "\n" +
    "Verbrauch: " + fuel_consumption + "\n" +
    "Nummernschild: " + licence + "\n" +
    "Raucher: " + smoker? ? "ja" : "nein"
  end

end
