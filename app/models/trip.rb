class Trip < ActiveRecord::Base
  belongs_to :user
  belongs_to :car
  has_many :ratings
  has_many :passengers

  has_and_belongs_to_many :users

  def to_s
    id 
  end

end
