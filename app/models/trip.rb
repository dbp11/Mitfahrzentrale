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


  #Brechnet Requests, die sich nur geringfügig von diesem Trip unterscheiden, und gibt ein Array aus
  #Wertepaaren zurück. Der erste Wert ist die request_id, der zweite gibt die Länge des Umweges an, den der 
  #Fahrer dieses Trips in Kauf nehmen müsste. Das Array ist absteigend nach Umwegen sortiert.
  def get_similar_requests
    distance = Geocoder::Calculations.distance_between [starts_at_N, starts_at_E], 
                                                       [ends_at_N, ends_at_E], :units => :km
    start_f = start_time.to_f
    erg = {}

    Request.all.each do |r|
      r_start_f = r.start_time.to_f
      r_end_f = r.end_time.to_f
      if start_f.between?(r_start_f, r_end_f) then  
        distance_start = Geocoder::Calculations.distance_between [r.starts_at_N, r.starts_at_E], 
                                                                 [starts_at_N, starts_at_E], :units => :km
        distance_end = Geocoder::Calculations.distance_between [r.ends_at_N, r.ends_at_E], 
                                                               [ends_at_N, ends_at_E], :units => :km
        distance_r = Geocoder::Calculations.distance_between [r.starts_at_N, r.start_at_E], 
                                                             [r.ends_at_N, r.ends_at_E], :units => :km
        difference = distance_r + distance_start + distance_end - distance
        erg[r.id] = difference
      end
    end

    erg.sort{|a,b| a[1] <=> b[1]}
  end
  
end
