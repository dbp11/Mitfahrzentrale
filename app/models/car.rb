# encoding: utf-8

class Car < ActiveRecord::Base
  belongs_to :user

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
