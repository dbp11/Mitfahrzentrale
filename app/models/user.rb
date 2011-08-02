# Modellierung der User-Entität mit seinen Datenfeldern zuzüglich           

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #Validations:
  # Stat. Integrität: Email muss vorhanden, einzigartig und min 8 char lang sein
  validates :email, :uniqueness => true, :presence => true, :length => {:minimum => 8}
  #Vermeidung von Nullwerten bei Name, Adresse, Plz, Stadt
  validates_presence_of :name, :address, :zipcode, :city 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :address, :zipcode, :birthday, :city, :sex, :phone, :instantmessenger, :visible_age, :visible_address, :visible_zip, :visible_phone, :visible_city, :visible_im, :visible_email, :visible_cars, :roles
  
  
  #Von Paperclip gefordertes Statement zum Anhängen von Bildern
  has_attached_file :picture, :styles => { :medium =>  "300x300>", :thumb => "100x100>"}

  #Beziehungen: 
  #
  #Join-Statement um über die Tabelle Passengers einen oder mehrere User mit einem Trip in Verbindung zu setzen. Die in der Tabelle Passengers gelisteten Userentitäten sind Mitfahrer
  has_many :passenger_trips, :class_name => "Trip", :through => :passengers, :source => :trip 
  #Beziehung zwischen Usern und Trips. Hierbei sind die User fahrer
  has_many :driver_trips, :class_name => "Trip", :foreign_key => "user_id"
  #1 User hat n Cars
  has_many :cars, :dependent => :destroy
  #1 User kann bei n Trips Mitfahrer gewesen sein
  has_many :passengers, :dependent => :destroy 
  #1 User kann viele Mitfahrgesuche haben
  has_many :requests, :dependent => :destroy

 
  #Selbstreferenzierende Beziehung User ignores User
  has_and_belongs_to_many :ignorings, :class_name => "User", :join_table => "ignore", :foreign_key => "ignored_id", :association_foreign_key => "ignoring_id"  
  has_and_belongs_to_many :ignoreds, :class_name => "User", :join_table => "ignore", :foreign_key => "ignoring_id", :association_foreign_key => "ignored_id"
  
  #Beziehung User schreibt n Usern Nachrichten/Ratings und bekommt von mehreren Usern Nachrichten und Bewertungen
  has_many :received_messages, :class_name => "Message", :foreign_key =>"receiver_id", :dependent => :destroy
  has_many :written_messages,  :class_name => "Message", :foreign_key =>"writer_id", :dependent => :destroy
  has_many :written_ratings, :class_name => "Rating", :foreign_key => "author_id", :dependent => :destroy
  has_many :received_ratings, :class_name => "Rating", :foreign_key => "receiver_id", :dependent => :destroy

  ROLES = %w[admin member]

  #Methoden:
  #toString Methode für User
  #@return string name
  def to_s
    name
  end


  #Vergangene angebotene Trips des Users
  #@return Trip [] erg
  def driven
   erg=[] 
   driver_trips.each do |x|
     if x.start_time < Time.now
       then erg = erg << x
     end
   end
   return erg
  end

  #Noch nicht vergangene angebotene Trips des Users
  #@return Trip [] erg
  def to_drive
    erg=[]
    driver_trips.each do |x|
      if x.start_time > Time.now
        then erg = erg << x
      end
    end
    return erg
  end

  #Vergangene Suchen des Users
  #@return Trip [] er 
  def driven_with
    erg=[]
    passenger_trips.each do |x|
      if x.start_time < Time.now
        then erg = erg << x
      end
    end
    return erg
  end

  #Noch laufende Suchen des Users
  #@return Trip [] erg
  def to_drive_with
    erg=[]
    passenger_trips.each do |x|
      if x.start_time > Time.now
        then erg = erg << x
      end
    end
    return erg
  end
  
  #Methode zur Ermittlung der durchschnittlichen Bewertung des Users
  #@return float erg/count auf 2 Nachkommastellen gerundet.
  def get_avg_rating
    count = 0
    erg = 0
    self.received_ratings.each do |x|
      erg = erg + x.mark
      count +=1
    end
    return (erg / count).round(2)
  end

  # Methode zum Zählen der erhaltenen Ratings
  # @return integer count
  def count_ratings
    count = 0
    self.received_ratings.each do |x|
      count += 1
    end
    return count
  end
end
