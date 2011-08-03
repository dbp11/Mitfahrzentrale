# = Die Klasse User
# Das User-Modell stellt den Dreh und Angelpunkt unseres Datenbanksystems dar. Mit ihm werden Trips und Gesuche 
# erstellt, Messages versandt, Ratings gegeben, an ihm die Profileinstellungen gespeichert. Folglich ist der User, 
# in hinsicht der Beziehungen, die komplexeste Klasse.
# Er besitzt folgende Datenfelder:
# *email :string -- E-Mail Adresse des Benutzers
# *encrypted_password :string -- verschlüsseltes Passwort des Benutzers (Devise Plugin)
# *reset_password_token :string -- Zurücksetzen des Passwortkürzels
# *reset_password_sent_at :datetime -- letztes Zurücksetzen des Passwort
# *remember_created_at :datetime -- Remember_Me Anlage am
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
# *instantmessenger :string -- Instantmessenger
# *city :string Wohnort
# *birthday :date -- Geburtsdatum des Users 
# *phone :string Telephonnummer
# *business :boolean -- Ist User Gewerbs- oder Privatanbieter
# *email_notifications -- E-Mail-Benachrichtigungen an- oder ausschalten
# *visible_phone :boolean -- Sichtbarkeit der Telephonnummer an- oder ausschalten
# *visible_email :boolean -- Sichtbarkeit der E-Mail an- oder ausschalten
# *visible_address :boolean -- Sichtbarkeit der Adresse an- oder ausschalten
# *visible_age :boolean -- Sichtbarkeit des Alter an- oder ausschalten
# *visible_im :boolean -- Sichtbarkeit des Instantmessenger an- oder ausschalten
# *visible_cars :boolean -- Sichtbarkeit der Autos an- oder ausschalten
# *visible_zip :boolean -- Sichtbarkeit der Postleitzahl an- oder ausschalten
# *visible_city :boolean -- Sichtbarkeit der Stadt an- oder ausschalten
# *picture_file_name :string -- <i>Von Paperclip gefordert</i> Name des gespeicherten Bildes
# *picture_content_type :string -- <i>Von Paperclip gefordert</i> Dateityp des Bildes
# *picture_file_size :integer -- <i>Von Paperclip gefordert </i> Größe des Bildes
# *picture_updated_at :datetime -- <i>Von Paperclip gefordert </i> letzte Bildänderung
class User < ActiveRecord::Base

  ####################### ==Railsplugin Devise ################################
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
  has_attached_file :pic, :styles => { :medium =>  "300x300>", 
                                           :thumb => "100x100>"}


  ############################ ==Validations: #################################
  # Stat. Integrität: Email muss vorhanden, unique und min 8 char lang sein
  # Name, Adresse, Plz, Stadt müssen vorhanden sein
  # Die boolschen Datenfelder zur Bestimmung der Sichtbarkeiten müssen gesetzt 
  # sein, also nicht Null
  validates :email, :uniqueness => true, :presence => true, 
  :length => {:minimum => 8}
  validates_presence_of :name, :address, :zipcode, :city 
  validate :booleans_not_nil

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

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :address, :zipcode, :birthday, :city, :sex, :phone, :instantmessenger, :visible_age, :visible_address, :visible_zip, :visible_phone, :visible_city, :visible_im, :visible_email, :visible_cars, :pic_file_size, :pic_file_name, :pic_content_type, :pic_update_at, :business, :pic
  
  
  #Von Paperclip gefordertes Statement zum Anhängen von Bildern
  has_attached_file :pic, :styles => { :medium =>  "300x300>", :thumb => "500x500>"}


 
  
  ############################# ==Beziehungen: #################################
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
 
  ################################################### ==Methoden: ####################################################
  #toString Methode für User
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
  #return Trip [] erg
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
  #@return Trip [] erg
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

  #Methode zur Ermittlung des durchschnittlichen Ratings des Users 
  #@return float 3, wenn User noch keine Bewertungen hat
  #@return float Sum(Ratings)/Anz(Ratings)
  def get_avg_rating
    count = 0
    erg = 0
    self.received_ratings.each do |x|
        erg = erg + x.mark
        count +=1
    end
    return erg.to_f / count.to_f
  end
  
  #Methode die alle Erhaltenen Ratings des Users zählt
  #@return integer count
  def count_ratings
    count = 0
    self.received_ratings.each do |x|
      count += 1
    end
    return count
  end

  #Methode, die alle gesendeten Nachrichten eines Users, die nicht gelöscht sind, zurückliefert
  #@return Message [] absteigend sortiert nach Datum
  def get_written_messages
    erg = []
    self.written_messages.each do |m|
      if !m.delete_writer? then
        erg << m
      end
    end
    erg.sort{|a,b| b.created_at <=> a.created_at}
  end

  #Methode, die alle empfangenen Nachrichten eines Users, die nicht gelöscht sind, zurückliefert
  #@return Message [] absteigend sortiert nach Datum
  def get_received_messages
    erg = []
    self.received_messages.each do |m|
      if !m.delete_receiver? then
        erg << m
      end
    end
    erg.sort{|a,b| b.created_at <=> a.created_at}
  end
  
  #Methode, die die relative Anzahl an Ignorierungen eines Users zurückliefert
  #@return float Ignorierungen_des_Users / Alle_User
  def get_relative_ignorations
    self.ignoreds.count.to_f / User.all.count.to_f
  end
  
  #Methode, die alle, für den User sichtbaren Autos zurückliefert.
  #Wenn ein User bei einem Trip Mitfahrer ist, so wird das Auto das Fahrers für ihn sichtbar
  #@return Car Set
  def get_visible_cars
    erg = Set.new
    self.passenger_trips.each do |c|
      if c.passengers.confirmed? and c.start_time > Time.now
        erg << c.car
      end
    end
  erg
  end
  
  #Methode, die alle, für einen User sichtbaren User zurückliefert
  #User werden für sichtbar, wenn der Benutzer mit diesen über einen Trip in verbindung gebracht werden kann
  #@return User [] 
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
  
  #@return gesammte als Mitfahrer zurückgelegte Distanz
  def toured_distance_p
    distance = 0
    self.driven_with.each do |t|
      distance += t.distance
    end
    distance
  end
  #@return gesammte als Mitfahrer gefahrene Zeit
  def toured_time_p
    time = 0
    self.driven_with.each do |t|
      time += t.duration
    end
    time
  end
  
  #@return gesammte als Fahrer zurückgelgete Distanz
  def toured_distance_d
    distance = 0
    self.driven.each do |t|
      distance += t.distance
    end
    distance
  end
  
  #@return gesammte als Fahrer gefahrene Zeit
  def toured_time_d
    time = 0
    self.driven_trips.each do |t|
      time += t.duration
    end
    time
  end
  
  #Methode die ermittelt, ob der aktuelle User vom übergebenen User zum übergebenen Trip schon bewertet wurde
  #@param User rater
  #@param Trip trp
  #@return false, wenn noch keine Bewertung abgegeben wurde
  #@return true, wenn eine Bewertung abgegeben wurde
  def allready_rated (rater, trp)
    check = false
    rater.written_ratings.each do |r|
      if r.receiver_id = self.id and r.trip_id = trp.id then check = true
      end
    end
    check
  end
  
  #Lässt einen User sich um eine Mitfahrgelegenheit bewerben
  #@param Trip trp um den sich beworben werden soll
  def bewerben (trp)
    t = Passenger.new("user_id" => self.id, "trip_id" => trp.id, :confirmed => false)
    t.save
  end
    
 
end
