# encoding: utf-8

class Car < ActiveRecord::Base
  
  #Beziehung: user_has_cars
  belongs_to :user
  has_many :trips

  #Kontrolle ob das Kennzeichen eine Gülitige Länge hat
  validates :licence, :uniqueness => true, :presence => true, :length => {:minimum => 1}

  #Validation ein Auto muss ein Nummernschild, Bezeichnung und Sitzplätze haben
  validates_presence_of :seats, :licence, :description 
  
  #Von Paperclip gefordertes Statement zum Anhängen von Bildern
  has_attached_file :carpic, :styles => { :medium =>  "400x400>", :thumb => "100x100>"}

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
