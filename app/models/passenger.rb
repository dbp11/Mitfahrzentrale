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
  validate :confirmed_not_nil

  #Methode die prüft ob der Wert confirmed nicht Null ist
  def confirmed_not_nil
    if(self.confirmed == nil)
      errors.add(:field, 'confirmed muss true oder false sein')
    end
  end

########################   Methoden für Controller   #######################

end
