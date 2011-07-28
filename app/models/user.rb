class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Stat. Integrität: Email muss vorhanden, unique und min 8 char lang sein
  validates :email, :uniqueness => true, :presence => true, :length => {:minimum => 8}

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  has_many :passengers
  has_many :requests
  has_many :passenger_trips, :class_name => "Trip", :through => :passengers, :source => :trip 
  has_many :driver_trips, :class_name => "Trip", :foreign_key => "user_id"
 
  #Selbstreferenzierende Beziehung User ignores User
  has_and_belongs_to_many :ignoring, :class_name => "User", :join_table => "ignore", :foreign_key => "ignored_id", :association_foreign_key => "ignoring_id" 
  has_and_belongs_to_many :ignored, :class_name => "User", :join_table => "ignore", :foreign_key => "ignoring_id", :association_foreign_key => "ignored_id"
  
  #Beziehung User schreibt User Nachricht/Rating
  has_many :received_messages, :class_name => "Message", :as =>"receiver"
  has_many :written_messages,  :class_name => "Message", :as =>"writer"
  has_many :s_ratings, :class_name => "Rating", :as => "rater"
  has_many :r_ratings, :class_name => "Rating", :as => "rated"
 
  #Methoden

  def to_s
    name
  end
  
  def driven
   erg [] 
   trip.driver_trips.each do |x|
     if x.end_time < Time.now
       then erg = erg + x
     end
    return erg
   end
  end

  def to_drive
    erg []
    trip.driver_trips.each do |x|
      if x.end_time > Time.now
        then erg = erg + x
      end
    end
  end

  def driven_with
    erg []
    trip.passenger_trip.each do |x|
      if x.end_time < Time.now
        then erg = erg + x
      end
    end
  end

  def to_drive_with
    erg []
    trip.passenger_trip.each do |x|
      if x.end_time > Time.now
        then erg = erg + x
      end
    end
  end

end
