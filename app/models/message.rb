class Message < ActiveRecord::Base
    has_many :writer, :class_name => "User"
    has_many :receiver, :class_name => "User"
    
    def to_s
      writer+ " an "+ receiver +": "+ message
    end
end
