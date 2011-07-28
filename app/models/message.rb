class Message < ActiveRecord::Base
<<<<<<< HEAD
  has_many :writer, :class_name => "User"
  has_many :receiver, :class_name => "User", :dependent => :destroy
=======
   
   #Beziehung Message zu User als writer oder receiver
   belongs_to  :writer, :class_name => "User"
   belongs_to  :receiver, :class_name => "User" 
    
   def to_s
     writer+ " an " +receiver+ ": " +message
   end
>>>>>>> 1625150ca54459fa875764906538b275c03addef

end
