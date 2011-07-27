class Car < ActiveRecord::Base
  belongs_to :user

  def to_s
    description
  end
end
