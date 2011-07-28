class Rating < ActiveRecord::Base
  
  
  belongs_to :trip
  belongs_to :rater, :class_name =>"User", :foreign_key => "written_by_id"
  belongs_to :rated, :class_name =>"User", :foreign_key => "written_by_id"

  def to_s
    comment
  end

end
