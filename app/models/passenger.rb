# <b>Modell Passenger.</b>
# Mit Passenger ist eine Joinrelation zwischen Usern und Trips gemeint. D.h. Passenger ist keine eigene Entität sondern eine Jointable, die jedoch notwendig ist, um ein boolsches Datenfeld für Accepted/not Accepted anzufügen.



class Passenger < ActiveRecord::Base
  
  #Beziehungen  
  belongs_to :user
  belongs_to :trip


end
