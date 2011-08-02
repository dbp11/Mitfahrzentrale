# ecoding: utf-8
require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = { 
      :name => "Example User",
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar",
      :age => 55,
      :sex => true,
      :address => "bla Strasse 20 blahausen 4444",
      :addressN => 45646,
      :addressE => 12313,
      :zipcode => 4444,
      :birthday => Time.now,
      :city => "fsfsf"
    }
    @attr_alternativ = { 
      :name => "Example User",
      :email => "balabla@fdnjf.com",
      :password => "foobar",
      :password_confirmation => "foobar",
      :age => 55,
      :sex => true,
      :address => "bla Strasse 20 blahausen 4444",
      :addressN => 45646,
      :addressE => 12313,
      :zipcode => 4444,
      :birthday => Time.now,
      :city => "fesffe"
    }
   @user = User.create!(@attr_alternativ) 
  end

  it "Kontrolle ob Validation city richtig funktoniert" do
     no_city_user = User.new(@attr.merge(:city => ""))
     no_city_user.should_not be_valid
  end

  it "Kontrolle driven richtig funktionier" do
    past = Time.now - 1.day
    old = Trip.new
    old.user = @user
    old.start_time = past
    old.save
    @user.driven.include? old
  end

  it "Kontrolle ob to_drive richtig funktioniert" do
    future = Time.now + 1.day
    newtrip = Trip.new
    newtrip.user = @user
    newtrip.start_time = future    
    newtrip.save
    @user.to_drive.include? future
  end

  it "Kontrolle ob User wirklich erstellt wird" do
    User.create!(@attr)
  end
  
  it "Kontrolle ob nicht korrekte email nicht zulässig ist" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "Kontrolle ob eine richtige email zulässig ist" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  it "Kontrolle ob email nicht korrekte email nicht zulässig ist" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  
  it "Kontrolle ob email eindeutig is" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "Kontrolle ob e-mail eindeutig ist" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  describe "passwords" do

    before(:each) do
      @user = User.new(@attr)
    end

    it "Kontrolle ob User password Attribut hat" do
      @user.should respond_to(:password)
    end

    it "Kontrolle ob User password_confirmation hat" do
      @user.should respond_to(:password_confirmation)
    end
  end
  
  describe "password validations" do

    it "Kontrolle ob leeres Password nicht zugelassen ist" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "Kontrolle ob password!=password_confirmation nicht zugelassen ist" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end
    
    it "Kontrolle ob zu kurzes password nicht zugelassen ist" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end
    
  end
  
  describe "password encryption" do
    
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "Kontrolle ob encrypted_password Attribut vorhanden ist" do
      @user.should respond_to(:encrypted_password)
    end

    it "Kontrolle ob encrypted_password nicht leer ist" do
      @user.encrypted_password.should_not be_blank
    end

  end
end
