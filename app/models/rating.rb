class Rating < ActiveRecord::Base
  belongs_to :trip
  
  belongs_to :sent_to_id, :class_name =>"User"
  belongs_to :written_by_id, :class_name =>"User"

  def to_s
    comment
  end

end
