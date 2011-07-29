class Request < ActiveRecord::Base

  #Beziehungen
  belongs_to :user

  #Berechnet Trips, die sich nur geringfügig von dieser Request unterscheiden, und gibt ein Array aus
  #Wertepaaren zurück. Der erste Wert ist die trip_id, der zweite gibt die Länge des Umweges an, den der
  #Fahrer dieses Trips in Kauf nehmen müsste. Das Array ist absteigend nach Umwegen sortiert.
  def get_similar_trips
    distance = Geocoder::Calculations.distance_between [starts_at_N, starts_at_E],
                                                       [ends_at_N, ends_at_E], :units => :km
    start_f = start_time.to_f
    end_f = end_time.to_f
    erg = {}

    Trip.all.each do |t|
      if t.start_time.to_f.between?(start_f, end_f) then
        distance_start = Geocoder::Calculations.distance_between [t.starts_at_N, t.starts_at_E],
                                                                 [starts_at_N, starts_at_E], :units => :km
        distance_end = Geocoder::Calculations.distance_between [t.ends_at_N, t.ends_at_E],
                                                               [ends_at_N, ends_at_E], :units => :km
        distance_t = Geocoder::Calculations.distance_between [t.starts_at_N, t.starts_at_E],
                                                             [t.ends_at_N, t.ends_at_E], :units => :km
        difference = distance + distance_start + distance_end - distance_t
        erg[t.id] = difference
      end
    end

    erg.sort{|a,b| a[1] <=> b[1]}
  end
end

