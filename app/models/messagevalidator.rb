class Messagevalidator < ActiveModel::Validator

  def validate
    if (options[:fields].any =="true")
      
    end
  end
end
