class Request < ActiveRecord::Base

  #Beziehungen
  belongs_to :user
  
  #Validation
  validates_presence_of :duration, :distance, :starts_at_N, :starts_at_E, :ends_at_N, :ends_at_E, :start_time, :end_time, :start_radius, :end_radius

  #Methode die alle zum Radius des suchenden Users die passenden Trips sucht
  #@return Array von Trips
  def get_available_trips
    start_f =start_time.to_f
    end_f = end_time.to_f
    erg = []

    Trip.all.each do |t|
      if (t.start_time.to_f.between?(start_f, end_f) and 
          ((Geocoder::Calculations.distance_between [t.starts_at_N, t.starts_at_E], 
           [starts_at_N, starts_at_E], :units => :km) <= self.start_radius) and
          ((Geocoder::Calculations.distance_between [t.ends_at_N, t.ends_at_E], 
           [ends_at_N, ends_at_E], :units => :km)  <= self.end_radius)) then 
        erg << t
      end
    end
    return erg
  end

  #Berechnet Trips, die sich nur geringfügig von dieser Request unterscheiden, und gibt ein Array aus
  #Wertepaaren zurück. Der erste Wert ist der Trip, der zweite gibt die Länge des Umweges an, den der
  #Fahrer dieses Trips in Kauf nehmen müsste. Das Array ist absteigend nach Umwegen sortiert.
  def get_sorted_trips
    trips = get_available_trips
    erg = []

    trips.each do |t|
      start_con = Gmaps4rails.destination({"from" => t.address_start, "to" => self.address_start},{},"pretty")
      end_con =  Gmaps4rails.destination({"from" => t.address_end, "to" => self.address_end},{},"pretty")
      
      start_distance = start_con[0]["distance"]["value"]
      start_duration = start_con[0]["duration"]["value"]

      end_distance = end_con[0]["distance"]["value"]
      end_duration = end_con[0]["duration"]["value"]

      t_rating = t.user.get_avg_rating.to_f / 6
      t_ignors = t.user.get_relative_ignorations
      detour = (start_distance + end_distance + self.distance - t.distance) / t.distance
      detime = (start_duration + end_duration + self.duration - t.duration) / t.duration

      erg << [t, Math.sqrt(t_rating*t_rating + t_ignors*t_ignors + detour*detour + detime*detime)]
    end

    erg.sort{|a,b| a[1] <=> b[1]}
    
  end


  def set_route
    route = Gmaps4rails.destination({"from" =>address_start, "to" =>address_end},{},"pretty")

    self.distance = route[0]["distance"]["value"]
    self.duration = route[0]["duration"]["value"]
  end
end

