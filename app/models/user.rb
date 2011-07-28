class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :uniqueness => true, :presence => true, :length => {:minimum => 1}

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_and_belongs_to_many :trips
  has_many :passengers
  has_many :requests, :dependent => :destroy
  has_many :cars, :dependent => :destroy

  has_and_belongs_to_many :ignoring, :class_name => "User", :join_table => "ignore", :foreign_key => "ignored_id", :association_foreign_key => "ignoring_id" 

 has_and_belongs_to_many :ignored, :class_name => "User", :join_table => "ignore", :foreign_key => "ignoring_id", :association_foreign_key => "ignored_id"

 belongs_to :message

  def to_s
    name
  end

 end
end
