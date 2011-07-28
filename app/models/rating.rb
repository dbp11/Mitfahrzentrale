class Rating < ActiveRecord::Base
  belongs_to :trip
  
<<<<<<< HEAD
  belongs_to :rater, :class_name =>"User"
  belongs_to :rated, :class_name =>"User",
=======
  belongs_to :sent_to_id, :class_name =>"User"
  belongs_to :written_by_id, :class_name =>"User"
>>>>>>> 4dec4dbd3b90293e2e9df444e960cd39ab430aab

  def to_s
    comment
  end

end
