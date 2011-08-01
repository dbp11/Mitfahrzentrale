class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #Validations:
  # Stat. Integrität: Email muss vorhanden, unique und min 8 char lang sein
  validates :email, :uniqueness => true, :presence => true, :length => {:minimum => 8}
  #Vermeidung von Nullwerten 
  validates_presence_of :name, :address, :zipcode, :city, :birthday 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :address, :zipcode, :birthday, :city, :sex, :phone, :instantmessenger, :roles
  
  
  #Von Paperclip gefordertes Statement zum Anhängen von Bildern
  has_attached_file :picture, :styles => { :medium =>  "300x300>", :thumb => "100x100>"}

  #Beziehungen:
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
  has_many :written_ratings, :class_name => "Rating", :as => "writer", :dependent => :destroy
  has_many :received_ratings, :class_name => "Rating", :as => "receiver", :dependent => :destroy

  ROLES = %w[admin member]

  #Methoden:
  #toString Methode für User
  def to_s
    name
  end
 
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0 ) & 2**ROLES.index(r)).zero?
    end
  end

  def is?(role)
    roles.nclude?(role.to_s)
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
end
