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
end
