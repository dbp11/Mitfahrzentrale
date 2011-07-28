class Trip < ActiveRecord::Base

  #Modellierung der Beziehungen
  belongs_to :user
  belongs_to :car
  
  
  has_many :users, :class_name => "User", :as => "passenger_trip", :through => :passengers, :source => :user, :dependent => :destroy
  has_many :ratings, :dependent => :destroy
  has_many :passengers, :dependent => :destroy
  
  def to_s
    id 
  end

  def get_similar_requests
    distance = distance_between [starts_at_N, starts_at_E] [ends_at_N, ends_at_E] {:km}
    erg = {}
    @trips = Requests.all.each do |t|
      distance_start = distance_between [t.starts_at_N, t.starts_at_E] [starts_at_N, starts_at_E] {:km}
      distance_end =  distance_between [t.ends_at_N, t.ends_at_E] [ends_at_N, ends_at_E] {:km}
      distance_t =  distance_between [t.starts_at_N, t.start_at_E] [t.ends_at_N, t.ends_at_E] {:km}
      difference = distance_t + distance_start + distance_end - distance
      erg[t.id] = difference
    end

    erg.sort{|a,b| a[1] <=> b[1]}
  end
  
end
