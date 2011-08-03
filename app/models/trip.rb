class Trip < ActiveRecord::Base
  include ActiveModel::Validations

  #Modellierung der Beziehungen
  belongs_to :user
  belongs_to :car 
  has_many :users, :class_name => "User", :as => "passenger_trip", :through => :passengers, :source => :user, :dependent => :destroy
  has_many :ratings, :dependent => :destroy
  has_many :passengers, :dependent => :destroy
  

  #Validation, eine Fahrt muss ein Datum, Startort, Zielort, freie Sitzplätze haben
  
  validate :start_time_in_past, :start_address_same_as_end_address, :baggage_not_nil

  validates_presence_of :address_start, :address_end, :start_time, :free_seats, :starts_at_N, :starts_at_E, :ends_at_N, :ends_at_E, :duration, :distance
  
  #Freie Sitzplätze dürfen nicht negativ sein
  validates_length_of :free_seats, :minimum => 1


  #Methoden:
  #toString Methode für Trips
  def to_s
    id 
  end
  

  #Methode die alle passenden Requests sucht
  #@return Array von Requests
  def get_available_requests
    start_f =start_time.to_f
    erg = []

    Request.all.each do |t|
      if (start_f.between?(t.start_time.to_f, t.end_time.to_f) and 
          ((Geocoder::Calculations.distance_between [t.starts_at_N, t.starts_at_E], 
           [starts_at_N, starts_at_E], :units => :km) <= t.start_radius) and
          ((Geocoder::Calculations.distance_between [t.ends_at_N, t.ends_at_E], 
           [ends_at_N, ends_at_E], :units => :km)  <= t.end_radius)) then 
        erg << t
      end
    end
    return erg
  end

  #Berechnet Trips, die sich nur geringfügig von dieser Request unterscheiden, und gibt ein Array aus
  #Wertepaaren zurück. Der erste Wert ist der Trip, der zweite gibt die Länge des Umweges an, den der
  #Fahrer dieses Trips in Kauf nehmen müsste. Das Array ist absteigend nach Umwegen sortiert.
  def get_sorted_requests
    requests = get_available_requests
    erg = []

    requests.each do |t|
      start_con = Gmaps4rails.destination({"from" => self.address_start, "to" => t.address_start},{},"pretty")
      end_con =  Gmaps4rails.destination({"from" => self.address_end, "to" => t.address_end},{},"pretty")
      
      start_distance = start_con[0]["distance"]["value"]
      start_duration = start_con[0]["duration"]["value"]

      end_distance = end_con[0]["distance"]["value"]
      end_duration = end_con[0]["duration"]["value"]

      t_rating = t.user.get_avg_rating.to_f / 6
      t_ignors = t.user.get_relative_ignorations
      detour = (t.distance + end_distance + self.distance - start_distance) / start_distance
      detime = (t.duration + end_duration + self.duration - start_duration) / start_duration

      erg << [t, Math.sqrt(t_rating*t_rating + t_ignors*t_ignors + detour*detour + detime*detime)]
    end

    erg.sort{|a,b| a[1] <=> b[1]}
    
  end


  #liefert die Anzahl freier Sitzplätze, die noch nicht vergeben sind
  def get_free_seats
    return free_seats - get_occupied_seats
  end
  
  # liefert die Anzahl belegter Sitzpläte
  def get_occupied_seats
    count = 0
    self.passengers.all.each do |p|
      if p.confirmed then
        count += 1
      end
    end
    return count
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

  #liefert alle user dieses Trips, die (noch) nicht committed wurdeni
  def get_uncommitted_passengers
    erg = []
    self.passengers.all.each do |p|
      if !p.confirmed then
        erg << p.user
      end
    end
    return erg
  end

  # Berechnet die komplette Route mit allen Zwischenziele
  def set_route
    route = Gmaps4rails.destination({"from" =>address_start, "to" =>address_end},{},"pretty")

    self.distance = route[0]["distance"]["value"]
    self.duration = route[0]["duration"]["value"]
  end
  
  # Berechnet die Entfernung in Metern
  def get_route_duration
    return duration.div(3600)+"Stunden"+(duration % 60)+ "Minuten" 
  end
 
  # Berechnet die benötigte Zeit in Sekunden
  def get_route_distance
    return (distance / 1000).round(3) + "Km"
  end

  # Methode prüft ob ein erstellter Trip in der Vergangenheit liegt
  def start_time_in_past
    if start_time < Time.now
      errors.add(:fields, 'Startzeit liegt in der Vergangenheit')
    end
  end
  
  #Start- und Endaddresse dürfen nicht übereinstimmen
  def start_address_same_as_end_address
    if (starts_at_N == ends_at_N and starts_at_E == ends_at_E)
      errors.add(:field, 'Startadresse = Endadresse, Fahrt lohnt sich nicht')
    end    
  end

  #Baggage darf nicht Null sein
  def baggage_not_nil
    if(self.baggage == nil)
      errors.add(:field, 'Baggage ist Null')
    end
  end

  def user_uncommitted (compared_user)
    get_uncommitted_passengers.include?(compared_user)
  end

  def user_committed (compared_user)
  get_committed_passengers.include?(compared_user)
  end

  def accept (compared_user)
    self.passengers.where("user_id = ?", compared_user.id).first.confirmed = true
  end

  def delete_unaccepted (compared_user)
    self.passengers.where("user_id = ?", compared_user.id).first.destroy
  end

end
