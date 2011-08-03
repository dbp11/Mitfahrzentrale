require 'spec_helper'

describe Request do
  before(:each) do
    @attr = {
      :starts_at_N => 12,
      :starts_at_E => 32,
      :ends_at_N => 45,
      :ends_at_E => 60,
      :address_start => "AHA Strasse 11 aha",
      :address_end => "Bla Strasse 9 bla",
      :start_time => Time.now - 6.day,
      :end_time => Time.now,
      :baggage => true,
      :comment => "AHA",
      :user_id => 456,
      :duration => 1231,
      :distance => 46546,
      :start_radius => 45,
      :end_radius => 6
    }
  end

  #Test ob Validations funktionieren
  it "duration!=nil Validation" do
   nil_duration = Request.new(@attr.merge(:duration => nil))
   nil_duration.should_not be_valid
  end

  it "distance!=nil Validation" do
    nil_distance = Request.new(@attr.merge(:distance => nil))
    nil_distance.should_not be_valid
  end

  it "starts_at_N!=nil Validation" do
    nil_start_at_N = Request.new(@attr.merge(:starts_at_N => nil))
    nil_start_at_N.should_not be_valid
  end

  it "starts_at_E!=nil Validation" do
    nil_starts_at_E = Request.new(@attr.merge(:starts_at_E => nil))
    nil_starts_at_E.should_not be_valid
  end

  it "ends_at_E!=nil Validation" do 
    nil_ends_at_E = Request.new(@attr.merge(:ends_at_E => nil))
    nil_ends_at_E.should_not be_valid
  end

  it "ends_at_N!=nil Validation" do
    nil_ends_at_N = Request.new(@attr.merge(:ends_at_N => nil))
    nil_ends_at_N.should_not be_valid
  end

  it "start_time!=nil Validation" do
    nil_start_time = Request.new(@attr.merge(:start_time => nil))
    nil_start_time.should_not be_valid
  end

  it "end_time!=nil Validation" do
    nil_end_time = Request.new(@attr.merge(:end_time => nil))
    nil_end_time.should_not be_valid
  end

  it "start_radius!=nil Validation" do
    nil_start_radius = Request.new(@attr.merge(:start_radius => nil))
    nil_start_radius.should_not be_valid
  end

  it "end_radius!=nil Validation" do
    nil_end_radius = Request.new(@attr.merge(:end_radius => nil))
    nil_end_radius.should_not be_valid
  end
  #Test ob Methoden funktionieren
end
