class Rating < ActiveRecord::Base
  
  
  belongs_to :trip
  belongs_to :author, :class_name =>"User" 
  belongs_to :receiver, :class_name =>"User"

  def to_s
    comment
  end

end
