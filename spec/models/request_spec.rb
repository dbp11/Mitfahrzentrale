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
      :user_id => 456
    }
  end

  #Test ob Validations funktionieren
  
  #Test ob Methoden funktionieren
end
