class Message < ActiveRecord::Base
  has_many :writer, :class_name => "User"
  has_many :receiver, :class_name => "User"

end
