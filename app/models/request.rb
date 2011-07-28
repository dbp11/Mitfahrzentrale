class Request < ActiveRecord::Base

  #Beziehungen
  belongs_to :user

  def get_similar_trips
    distance = distance_between [starts_at_N, starts_at_E] [ends_at_N, ends_at_E] {:km}
    erg = {}
    @trips = Trips.all.each do |t|
      distance_start = distance_between [t.starts_at_N, t.starts_at_E] [starts_at_N, starts_at_E] {:km}
      distance_end =  distance_between [t.ends_at_N, t.ends_at_E] [ends_at_N, ends_at_E] {:km}
      distance_t =  distance_between [t.starts_at_N, t.start_at_E] [t.ends_at_N, t.ends_at_E] {:km}
      difference = distance + distance_start + distance_end - distance_t
      erg[t.id] = difference
    end

    erg.sort{|a,b| a[1] <=> b[1]}
  end

end
