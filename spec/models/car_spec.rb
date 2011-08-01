require 'spec_helper'

describe Car do
  before(:each) do
    @attr = {
      :user_id => 45645,
      :seats => 5,
      :licence => "1231",
      :fuel_consumption => 5.5,
      :smoker => true,
      :description => "AHA",
    }
    @attr2 = {
      :user_id => 45645,
      :seats => 5,
      :licence => "1231",
      :fuel_consumption => 6.5,
      :smoker => true,
      :description => "AHA"
    }
  end

  it "Kontrolle ob Validation von licence" do
    no_right_licence = Car.new(@attr.merge(:licence => ""))
    no_right_licence.should_not be_valid 
  end
end
