class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #Validations:
  # Stat. Integrität: Email muss vorhanden, unique und min 8 char lang sein
  validates :email, :uniqueness => true, :presence => true, :length => {:minimum => 8}
  #Vermeidung von Nullwerten 
  validates_presence_of :name, :address, :zipcode, :city 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :address, :zipcode, :birthday, :city, :sex, :phone, :instantmessenger, :visible_age, :visible_address, :visible_zip, :visible_phone, :visible_city, :visible_im, :visible_email, :visible_cars
  
  
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
    erg.sort{|a,b| a.created_at <=> b.created_at}
  end

  def get_received_messages
    erg = []
    self.received_messages.each do |m|
      if !m.delete_receiver? then
        erg << m
      end
    end
    erg.sort{|a,b| a.created_at <=> b.created_at}
  end

  def get_relative_ignorations
    self.ignoreds.count.to_f / User.all.count.to_f
  end 
end
