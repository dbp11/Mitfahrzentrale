require 'spec_helper'

describe Trip do
  before(:each) do
    @attr = {
      :user_id => 4564,
      :car_id => 545,
      :starts_at_N => 12,
      :starts_at_E => 35,
      :ends_at_E => 45,
      :ends_at_N => 5,
      :address_start => "grrggrdrg",
      :address_end => "fsefsefffse",
      :start_time => Time.now,
      :comment => "fejskfsbnfjkfesfse",
      :baggage => true,
      :free_seats => 4
    }
  end
  
  #Test ob Validations funktionieren
  it "Kontrolle ob Validation address_start funktioniert" do
    no_address_start = Trip.new(@attr.merge(:address_start => nil))
    no_address_start.should_not be_valid
  end

  it "Kontrolle ob Validation address_end funktioniert" do
    no_address_end = Trip.new(@attr.merge(:address_end => nil))
    no_address_end.should_not be_valid
  end

  it "Kontrolle ob Validation start_time funktioniert" do
    no_start_time = Trip.new(@attr.merge(:start_time => nil))
    no_start_time.should_not be_valid
  end

  #Test ob Methoden funktionieren
end
