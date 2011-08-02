# encoding: utf-8
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
      :user_id => 45655,
      :seats => 5,
      :licence => "1231",
      :fuel_consumption => 6.5,
      :smoker => true,
      :description => "AHA"
    }
  end
  
  #Test ob Validation funktionieren
  it "Kontrolle der Eindeutigkeit der licence" do
    Car.create(@attr)
    double_licence = Car.new(@attr2)
    double_licence.should_not be_valid
  end
  it "Kontrolle der Beschränkung für licence" do
    no_right_licence = Car.new(@attr.merge(:licence => ""))
    no_right_licence.should_not be_valid 
  end

  it "Kontrolle der Validation für licence" do
    no_right_licence = Car.new(@attr.merge(:licence => nil))
    no_right_licence.should_not be_valid
  end

  it "Kontrolle der Validation für description" do
    no_right_description = Car.new(@attr.merge(:description => nil))
    no_right_description.should_not be_valid
  end

  it "Kontrolle der Validation für seats" do
    no_right_seats = Car.new(@attr.merge(:seats => nil))
    no_right_seats.should_not be_valid
  end

end
