class Rating < ActiveRecord::Base
  
#############################   Beziehungen   ############################
  #:Beziehungen
  #Beziehung: trip_gets_rating
  belongs_to :trip
  #Beziehung: user_writes_rating
  belongs_to :author, :class_name =>"User"
  #Bziehung: user_gets_rating
  belongs_to :receiver, :class_name =>"User"

#############################   Validations   ############################
  

  #Validation
  validates_numericality_of :mark, :only_interger => true, :message => "Note kann nur ganze Zahl sein"
  validates_inclusion_of :mark, :in => 1..6, :message => "Note kann nur von 1 bis 6 verteilt werden"


########################   Methoden für Controller   #######################

  #to String Methode für Ratings
  def to_s
    comment
  end

end
