class Trip < ActiveRecord::Base

  #Modellierung der Beziehungen
  belongs_to :user
  belongs_to :car 
  has_many :users, :class_name => "User", :as => "passenger_trip", :through => :passengers, :source => :user, :dependent => :destroy
  has_many :ratings, :dependent => :destroy
  has_many :passengers, :dependent => :destroy
  

  #Validation, eine Fahrt muss ein Datum, Startort, Zielort, freie Sitzplätze haben
  
  validates_presence_of :address_start, :address_end, :start_time, :free_seats
  
  #Freie Sitzplätze dürfen nicht negativ sein
  validates_length_of :free_seats, :in => 1..200


  #Methoden:
  #toString Methode für Trips
  def to_s
    id 
  end


  #Berechnet Requests, die sich nur geringfügig von diesem Trip unterscheiden, und gibt ein Array aus
  #Wertepaaren zurück. Der erste Wert ist die request_id, der zweite gibt die Länge des Umweges an, den der 
  #Fahrer dieses Trips in Kauf nehmen müsste. Das Array ist absteigend nach Umwegen sortiert.
  def get_similar_requests
    distance = Geocoder::Calculations.distance_between [starts_at_N, starts_at_E], 
                                                       [ends_at_N, ends_at_E], :units => :km
    start_f = start_time.to_f
    erg = []

    Request.all.each do |r|
      r_start_f = r.start_time.to_f
      r_end_f = r.end_time.to_f
      if start_f.between?(r_start_f, r_end_f) then  
        distance_start = Geocoder::Calculations.distance_between [r.starts_at_N, r.starts_at_E], 
                                                                 [starts_at_N, starts_at_E], :units => :km
        distance_end = Geocoder::Calculations.distance_between [r.ends_at_N, r.ends_at_E], 
                                                               [ends_at_N, ends_at_E], :units => :km
        distance_r = Geocoder::Calculations.distance_between [r.starts_at_N, r.starts_at_E], 
                                                             [r.ends_at_N, r.ends_at_E], :units => :km
        difference = distance_r + distance_start + distance_end - distance
        erg << [r, difference]
      end
    end

    erg.sort{|a,b| a[1] <=> b[1]}
  end


  #liefert die Anzahl freier Sitzplätze, die noch nicht vergeben sind
  def get_free_seats
    count = 0
    self.passengers.all.each do |p|
      if p.confirmed then
        count += 1
      end
    end
    return free_seats - count
  end

  #liefert alle user dieses Trips, die schon committed wurden
  def get_committed_passengers
    erg = []
    self.passengers.all.each do |p|
      if p.confirmed then
        erg << p.user
      end
    end
    return erg
  end

  #liefert alle user dieses Trips, die (noch) nicht committed wurden
  def get_uncommitted_passengers
    erg = []
    self.passengers.all.each do |p|
      if !p.confirmed then
        erg << p.user
      end
    end
    return erg
  end
end
