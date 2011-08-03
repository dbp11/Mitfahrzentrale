# = Die Klasse User
# Das User-Modell stellt den Dreh und Angelpunkt unseres Datenbanksystems dar. Mit ihm werden Trips und Gesuche 
# erstellt, Messages versandt, Ratings gegeben, an ihm die Profileinstellungen gespeichert. Folglich ist der User, 
# in hinsicht der Beziehungen, die komplexeste Klasse.
# Er besitzt folgende Datenfelder:
# *sign_in_count :integer -- Anzahl der Logins
# *current_sign_in_at :datetime -- Aktuell eingeloggt um
# *last_sign_in_at :datetime -- Zuletzt eingeloggt am
# *created_at :datetime -- <i>Von Rails automatisch angelegt:</i> Erstellungsdatum des Users
# *updated_at :datetime -- <i>Vom Rails automatisch angelegt:</i> Letztes Update an den Datenfeldern
# *name :string -- Nutzername
# *user_type :boolean -- Adminrechte ja/nein
# *sex :boolean -- false weiblich, true männlich
# *address :string -- Straße, Hausnummer
# *addressN :float -- <i>Von Geocoder benötigt:</i> nördliche Breite der Adresse 
# *addressE :float -- <i>Von Geocoder benötigt:</i> östliche Länge der Adresse
# *zipcode :integer -- Postleitzahl
# *
#





class User < ActiveRecord::Base

  ####################### Railsplugin Devise ################################
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, 
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, 
    :remember_me, :address, :zipcode, :birthday, :city, :sex, :phone, 
    :instantmessenger, :visible_age, :visible_address, :visible_zip, 
    :visible_phone, :visible_city, :visible_im, :visible_email, :visible_cars
  #Von Paperclip gefordertes Statement zum Anhängen von Bildern
  has_attached_file :picture, :styles => { :medium =>  "300x300>", 
                                           :thumb => "100x100>"}


  ############################ Validations: #################################
  # Stat. Integrität: Email muss vorhanden, unique und min 8 char lang sein
  # Name, Adresse, Plz, Stadt müssen vorhanden sein
  # Die boolschen Datenfelder zur Bestimmung der Sichtbarkeiten müssen gesetzt 
  # sein, also nicht Null
  validates :email, :uniqueness => true, :presence => true, 
  :length => {:minimum => 8}
  validates_presence_of :name, :address, :zipcode, :city 
  validate :booleans_not_nil


 
  
  ############################# Beziehungen: #################################
  #Beziehung vom Modell User zu Trip über die Joinrelation Passengers 
  #(:through => Passengers) als passenger_trips
  has_many :passenger_trips, :class_name => "Trip", :through => :passengers, 
    :source => :trip 
  #Beziehung vom User zu Trip, wobei der User hier, anders als bei
  #Passenger_Trips nicht Mitfahrer, sondern Fahrer ist
  has_many :driver_trips, :class_name => "Trip", :foreign_key => "user_id"
  has_many :cars, :dependent => :destroy
  #Beziehung von User zur Jointable Passengers - Diese Relation ist notwendig 
  #um zu überprüfen, ob ein User als Mitfahrer akzeptiert oder abgelehnt wurde
  has_many :passengers, :dependent => :destroy
  #Beziehung vom User zu Requests. Requests stellen die Gesuche dar, also
  #Strecken, die man als Nutzer gerne als Mitfahrer begehen würde. 
  has_many :requests, :dependent => :destroy
  #Selbstreferenzierende Beziehung User ignores User
  #Bei dieser Relation wird ein User mit einem anderen User in der Jointable
  #Ignores in Beziehung gesetzt.
  #Die Jointable Ignores hat kein eigenes Model, nur eine Migration, d.h. alle
  #Methoden werden über den User abgewickelt
  has_and_belongs_to_many :ignorings, :class_name => "User", :join_table  => "ignore", :foreign_key =>
  "ignored_id", :association_foreign_key => "ignoring_id"  
  has_and_belongs_to_many :ignoreds, :class_name => "User", :join_table => "ignore", :foreign_key =>
  "ignoring_id", :association_foreign_key => "ignored_id"
  #Beziehung User schreibt User Nachricht/Rating
  #Anders als bei der selbstreferenzierenden User_ignores_User-Beziehung müssen für die Beziehungen Message und Rating
  #jeweils eigene Modellklassen erstellt werden, da diese zusätzlich einen Text als Datenfeld besitzen, d.h. 
  #die Klassen Message und Rating funktionieren als "Joinentitäten" für die Klasse User.
  has_many :received_messages, :class_name => "Message", :foreign_key =>"receiver_id", :dependent => :destroy
  has_many :written_messages,  :class_name => "Message", :foreign_key =>"writer_id", :dependent => :destroy
  has_many :written_ratings, :class_name => "Rating", :foreign_key => "author_id", :dependent => :destroy
  has_many :received_ratings, :class_name => "Rating", :foreign_key => "receiver_id", :dependent => :destroy
 
  #Methoden:
  #toString Methode für User
  def to_s
    name
  end
  
  #Vergangene angebotene Trips des Users
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
  def to_drive_with
    erg=[]
    passenger_trips.each do |x|
      if x.start_time > Time.now
        then erg = erg << x
      end
    end
    return erg
  end

  def get_avg_rating
    count = 0
    erg = 0
    #if self.received_ratings.empty? 
    #  return 3
   # else
      self.received_ratings.each do |x|
        erg = erg + x.mark
        count +=1
      end
      return erg.to_f / count.to_f
    #end
  end

  def count_ratings
    count = 0
    self.received_ratings.each do |x|
      count += 1
    end
    return count
  end

  def get_written_messages
    erg = []
    self.written_messages.each do |m|
      if !m.delete_writer? then
        erg << m
      end
    end
    erg.sort{|a,b| b.created_at <=> a.created_at}
  end

  def get_received_messages
    erg = []
    self.received_messages.each do |m|
      if !m.delete_receiver? then
        erg << m
      end
    end
    erg.sort{|a,b| b.created_at <=> a.created_at}
  end

  def get_relative_ignorations
    self.ignoreds.count.to_f / User.all.count.to_f
  end

  def get_visible_cars
    erg = Set.new
    self.passenger_trips.each do |c|
      if c.passengers.confirmed? and c.start_time > Time.now
        erg << c.car
      end
    end
  erg
  end

  def get_visible_users
    erg = Array.new
    self.passengers.each do |p|
      if p.confirmed? and p.trip.start_time > Time.now
        p.trip.users.each do |u|
          erg << u
        end
      end
      erg << p.trip.user
    end
    self.driver_trips.each do |d|
      if d.start_time > Time.now
        d.users.each do |u|
          erg << u
        end
      end
    end
    return erg
  end

  def booleans_not_nil 
    if(self.user_type == nil and self.sex == nil and 
       self.email_notifications == nil and self.visible_phone == nil and 
       self.visible_email == nil and self.visible_address == nil and 
       self.visible_age == nil and self.visible_im == nil and 
       self.visible_cars == nil and self.visible_cip == nil and 
       self.visible_city == nil and self.business == nil)
      errors.add(:field, 'Irgendein Boolean nimmt den Wert Null ein, und das dar nicht sein, also gar nicht')
    end
  end

  def get_coming_requests
    erg = []
    self.requests.each do |r|
      if r.created_at > Time.now
        erg << r
      end
    end
    return
  end

  def toured_distance_p
    distance = 0
    self.passenger_trips.each do |t|
      distance += t.distance
    end
    distance
  end

  def toured_time_p
    time = 0
    self.passenger_trips.each do |t|
      time += t.duration
    end
    time
  end

  def toured_distance_d
    distance = 0
    self.driver_trips.each do |t|
      distance += t.distance
    end
    distance
  end

  def toured_time_d
    time = 0
    self.driver_trips.each do |t|
      time += t.duration
    end
    time
  end

  def already_rated (rater, trp)
    check = false
    rater.written_ratings.each do |r|
      if r.receiver_id = self.id and r.trip_id = trp.id then check = true
      end
    end
    check
  end

  def bewerben (trp)
    Passenger.new("user_id" => self.id, "trip_id" => trp.id, "confirmed" => false)
  end
    
 
end
