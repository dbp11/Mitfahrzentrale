class Message < ActiveRecord::Base
 
   
   #Beziehung Message zu User als writer oder receiver
   belongs_to  :writer, :class_name => "User"
   belongs_to  :receiver, :class_name => "User" 
   def to_s
     writer+ " an " +receiver+ ": " +message
   end



end
