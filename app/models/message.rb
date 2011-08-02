class Message < ActiveRecord::Base
 
     
  #Beziehungen:
  #Beziehung:users_write_messages
  belongs_to  :writer, :class_name => "User"
  #Beziehung:users_receive_messages
  belongs_to  :receiver, :class_name => "User"
   
  #Validation
  validates_with Messagevalidator, :fields => [:delete_writer, :delete_receiver]

  #Methoden:
  #to String Methode für Message
  def to_s  
    writer+ " an " +receiver+ ": " +message
  end



end
