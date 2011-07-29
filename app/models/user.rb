class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Stat. Integrität: Email muss vorhanden, unique und min 8 char lang sein
  validates :email, :uniqueness => true, :presence => true, :length => {:minimum => 8}

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  has_many :passenger_trips, :class_name => "Trip", :through => :passengers, :source => :trip 
  has_many :driver_trips, :class_name => "Trip", :foreign_key => "user_id"
  has_many :cars, :dependent => :destroy
  has_many :passengers, :dependent => :destroy 
  has_many :requests, :dependent => :destroy

 
  #Selbstreferenzierende Beziehung User ignores User
  has_and_belongs_to_many :ignorings, :class_name => "User", :join_table => "ignore", :foreign_key => "ignored_id", :association_foreign_key => "ignoring_id"  
  has_and_belongs_to_many :ignoreds, :class_name => "User", :join_table => "ignore", :foreign_key => "ignoring_id", :association_foreign_key => "ignored_id"
  
  #Beziehung User schreibt User Nachricht/Rating
  has_many :received_messages, :class_name => "Message", :as =>"receiver", :dependent => :destroy
  has_many :written_messages,  :class_name => "Message", :as =>"writer", :dependent => :destroy
  has_many :written_ratings, :class_name => "Rating", :as => "author", :dependent => :destroy
  has_many :received_ratings, :class_name => "Rating", :as => "receiver", :dependent => :destroy
 
  #Methoden

  def to_s
    name
  end
  
  def driven
   erg=[] 
   driver_trips.each do |x|
     if x.end_time < Time.now
       then erg = erg << x
     end
   end
   return erg
  end

  def to_drive
    erg=[]
    driver_trips.each do |x|
      if x.end_time > Time.now
        then erg = erg << x
      end
    end
    return erg
  end

  def driven_with
    erg=[]
    passenger_trip.each do |x|
      if x.end_time < Time.now
        then erg = erg << x
      end
    end
    return erg
  end

  def to_drive_with
    erg=[]
    passenger_trip.each do |x|
      if x.end_time > Time.now
        then erg = erg << x
      end
    end
    return erg
  end

end
