require 'spec_helper'

describe Car do
  before(:each) do
    @attr = {
      :user_id => 45645,
      :seats => 5,
      :licence => 1231,
      :fuel_consumption => 5.5,
      :smoker => true,
      :description => "AHA",
    }
  end

  it "Kontrolle ob Validation von licence" do
    no_right_licence = User.new(@attr.merge(:licence => ""))
    no_right_licence.should_not be_valid 
  end

  it "Kontrolle ob Validation von seats" do
    no_right_seats = User.new(@attr.merge(:seats => nil))
    no_right_seats.should_not be valid
  end

  it "Kontrolle ob Validation von description" do
    no_right_description = User.new(@attr.merge(:description => nil))
    no_right_description.should_not be valid
  end

  it "Kontrolle ob licence eindeutig sein muss" do
    first_licence = User.create(@attr.merge(:licence => "1"))
    double_licence = User.new(@attr.merge(:licence => "1"))
    double_licence.should_not be valid
  end
end
