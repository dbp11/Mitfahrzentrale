# encoding: utf-8
class Message < ActiveRecord::Base
  include ActiveModel::Validations 
     
  #Beziehungen:
  #Beziehung:users_write_messages
  belongs_to  :writer, :class_name => "User"
  #Beziehung:users_receive_messages
  belongs_to  :receiver, :class_name => "User"
   
  #Validation
  validate :no_true_true, :delete_writer_nil, :delete_receiver_nil
  
  #Methoden:
  #no_true_true für Validate
  def no_true_true
    if (self.delete_writer? and self.delete_receiver?)
      errors.add(:field, 'Nachricht wird gelöscht!')
    end
  end
  
  #delete_writer darf nicht Null werden
  def delete_writer_nil
    if(self.delete_writer == nil)
      errors.add(:field, 'delete_writer bzw. delete_receiver nil')
    end
  end

  def delete_receiver_nil 
    if(self.delete_receiver == nil)
      errors.add(:field, 'delete_writer bzw. delete_receiver nil')
    end
  end
  #to String Methode für Message
  def to_s  
    writer+ " an " +receiver+ ": " +message
  end

  




end
