# encoding: utf-8
class Message < ActiveRecord::Base
  include ActiveModel::Validations 
     
  #Beziehungen:
  #Beziehung:users_write_messages
  belongs_to  :writer, :class_name => "User"
  #Beziehung:users_receive_messages
  belongs_to  :receiver, :class_name => "User"
   
  #Validation
  #validate :no_true_true
  #validates_presence_of :delete_writer, :delete_receiver
  #Methoden:
  #no_true_true für Validate
  def no_true_true
    errors.add(:base,"Nicht möglich da Nachricht glöscht wird!") unless if((delete_receiver==true and delete_writer==false) or (delete_receiver==false and delete_writer==true) or (delete_receiver==false and delete_writer==false)) 
  end
  end
  #to String Methode für Message
  def to_s  
    writer+ " an " +receiver+ ": " +message
  end

  




end
