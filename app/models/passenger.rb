# <b>Modell Passenger.</b>
# Mit Passenger ist eine Joinrelation zwischen Usern und Trips gemeint. D.h. Passenger ist keine eigene Entität sondern eine Jointable, die jedoch notwendig ist, um ein boolsches Datenfeld für Accepted/not Accepted anzufügen.



class Passenger < ActiveRecord::Base
   include ActiveModel::Validations 

#############################   Beziehungen   ############################
    
  #Beziehungen  
  belongs_to :user
  belongs_to :trip
  
#############################   Validations   ############################
  
  
  #Validation
  validates_presence_of :user_id, :trip_id
  validate :confirmed_not_nil, :not_his_own_driver

  #Methode die prüft ob der Wert confirmed nicht Null ist
  def confirmed_not_nil
    if(self.confirmed == nil)
      errors.add(:field, 'confirmed muss true oder false sein')
    end
  end

  def not_his_own_driver
    if self.user.in(self.trip.users)
      errors.add(:field, 'driver must not be his own passenger')
    end
  end

########################   Methoden für Controller   #######################

end
