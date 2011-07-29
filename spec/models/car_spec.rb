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
end
