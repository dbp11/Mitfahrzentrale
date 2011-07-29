class Rating < ActiveRecord::Base
  
  #Beziehungen:
  #Beziehung: trip_gets_rating
  belongs_to :trip
  #Beziehung: user_writes_rating
  belongs_to :author, :class_name =>"User"
  #Bziehung: user_gets_rating
  belongs_to :receiver, :class_name =>"User"

  #to String Methode für Ratings
  def to_s
    comment
  end

end
