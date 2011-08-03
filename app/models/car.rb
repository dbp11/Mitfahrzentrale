# encoding: utf-8

class Car < ActiveRecord::Base
  
#############################   Beziehungen   ############################
  belongs_to :user
  has_many :trips


#############################   Validations   ############################
  
  
  #Kontrolle ob das Kennzeichen eine Gülitige Länge hat
  validates :licence, :uniqueness => true, :presence => true, :length => {:in => 1..10}

  #Validation ein Auto muss ein Nummernschild, Bezeichnung und Sitzplätze haben
  validates_presence_of :seats, :licence, :car_type, :user_id 
  
  validates_numericality_of :price_km, :message => "Deine Eingabe muss aus Zahlen bestehen"
  validates_length_of :description, :in => 0..160
  


########################   Methoden für Controller   #######################
  
  

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
