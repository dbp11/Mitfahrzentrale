class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Stat. Integrität: Email muss vorhanden, unique und min 8 char lang sein
  validates :email, :uniqueness => true, :presence => true, :length => {:minimum => 8}

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  has_many :cars, :dependent => :destroy
  has_many :passengers, :dependent => :destroy 
  has_many :requests, :dependent => :destroy
  has_many :trips, :through => :passengers, :dependent => :destroy

 
  #Selbstreferenzierende Beziehung User ignores User
  has_and_belongs_to_many :ignoring, :class_name => "User", :join_table => "ignore", :foreign_key => "ignored_id", :association_foreign_key => "ignoring_id", :dependent => :destroy  
  has_and_belongs_to_many :ignored, :class_name => "User", :join_table => "ignore", :foreign_key => "ignoring_id", :association_foreign_key => "ignored_id", :dependent => :destroy
  
  #Beziehung User schreibt User Nachricht/Rating
  has_many :received_messages, :class_name => "Message", :as =>"receiver", :dependent => :destroy
  has_many :written_messages,  :class_name => "Message", :as =>"writer", :dependent => :destroy
  has_many :s_ratings, :class_name => "Rating", :as => "rater", :dependent => :destroy
  has_many :r_ratings, :class_name => "Rating", :as => "rated", :dependent => :destroy
 

  def to_s
    name
  end

end
