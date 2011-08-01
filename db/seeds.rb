# encoding: utf-8

#Creates 5 User
user1 = User.create! :email => "ahaaha@gmx.com", :password => "ahaaha",:password_confirmation => "ahaaha", :name => "rgdrggrdg", :user_type => true, :sex => true, :address => "ragkagr nrgsjg grgdg 454", :addressN => 4, :addressE => 4, :zipcode => 1564, :phone => 1231464, :instantmessenger => "grdgd", :city => "sgrsgg", :email_notifications => true, :visible_phone => true, :visible_email => true, :visible_address => true, :visible_age => true, :visible_im => false, :visible_cars => true, :birthday => Time.now, :role => "fesfse", :visible_zip => true
user2 = User.create! :email => "ahfwef@aol.com", :password => "gdsgrgrg",:password_confirmation => "gdsgrgrg", :name => "rdgggrdg", :user_type => false, :sex => false, :address => "ragkagr nrgsjg grgdg 454"   , :addressN => 3, :addressE => 5, :zipcode => 4564645, :phone => 456465, :instantmessenger => "grggrgrd", :city => "rsgsgr", :email_notifications => false, :visible_phone => true, :visible_email => false, :visible_address => false, :visible_age => true, :visible_im => false, :visible_cars => true, :birthday => Time.now-3.day, :role => "rgrgr", :visible_zip => false
user3 = User.create! :email => "feffeff@t-online.de", :password => "gsgsgsgs", :password_confirmation => "gsgsgsgs" ,:name => "grdgdrg", :user_type => true, :sex => false, :address => "ragkagr nrgsjg grgdg 454"   , :addressN => 2, :addressE => 4, :zipcode => 456, :phone => 4564, :instantmessenger => "grggrsg", :city => "rggrrg", :email_notifications => true, :visible_phone => false, :visible_email => true, :visible_address => false, :visible_age => true, :visible_im => true, :visible_cars => false, :birthday => Time.now, :role => "grrggr", :visible_zip => true
user4 = User.create! :email => "fefafnf@aol.com", :password => "rgrggsgr",:password_confirmation => "rgrggsgr" ,:name => "rggdgd", :user_type => true, :sex => false, :address => "ragkagr nrgsjg grgdg 454"   , :addressN => 32, :addressE => 56, :zipcode => 793131676, :phone => 5646464564, :instantmessenger => "rgrsdgsaqwrqq", :city => "rgsgrsg", :email_notifications => true, :visible_phone => true, :visible_email => false, :visible_address => true, :visible_age => false, :visible_im => true, :visible_cars => false, :birthday => Time.now, :role => "rggggrsgs", :visible_zip => false
user5 = User.create! :email => "admin@gmx.com", :password => "rgsgrdgrgrd",:password_confirmation => "rgsgrdgrgrd" ,:name => "grgrdgg", :user_type => true, :sex => false, :address => "ragkagr nrgsjg grgdg 454"   , :addressN => 51, :addressE => 32, :zipcode => 12312, :phone => 4564646, :instantmessenger => "rdgrgdrg", :city => "grwewgsb", :email_notifications => true, :visible_phone => false, :visible_email => true, :visible_address => false, :visible_age => true, :visible_im => false, :visible_cars => true, :birthday => Time.now, :role => "grgsg", :visible_zip => true

#Creates 5 cars
car1 = Car.create! :user_id => 1, :seats => 5, :licence => "10234", :fuel_consumption => 5.5, :smoker => true, :description => "Kein Kofferraum"
car2 = Car.create! :user_id => 2, :seats => 2, :licence => "40321", :fuel_consumption => 6.7, :smoker => false, :description => "Kofferraum verfügbar aber kein Platz"
car3 = Car.create! :user_id => 3, :seats => 3, :licence => "12345", :fuel_consumption => 8.9, :smoker => true, :description => "Auto rostet und keine Reifen"
car4 = Car.create! :user_id => 4, :seats => 4, :licence => "54321", :fuel_consumption => 11.1, :smoker => false, :description => "Test test"
car5 = Car.create! :user_id => 5, :seats => 2, :licence => "45646", :fuel_consumption => 20.3, :smoker => true, :description => "aha aha! Hier soll etwas sinnvolles stehen?"

#Creates 5 messages
msg1 = Message.create! :message => "Man man man, dass war ein Trip ;)!", :writer_id => 1, :receiver_id => 2
msg2 = Message.create! :message => "Oje Oje!", :writer_id => 2, :receiver_id => 3
msg3 = Message.create! :message => "nbajgggsr", :writer_id => 3, :receiver_id => 4
msg4 = Message.create! :message => "Bam", :writer_id => 4, :receiver_id => 5
msg5 = Message.create! :message => "Nil", :writer_id => 5, :receiver_id => 1

#Creates passenger
ps1 = Passenger.create! :user_id => 2, :trip_id => 1, :confirmed => true
ps2 = Passenger.create! :user_id => 3, :trip_id => 2, :confirmed => false
ps3 = Passenger.create! :user_id => 4, :trip_id => 3, :confirmed => true
ps4 = Passenger.create! :user_id => 5, :trip_id => 4, :confirmed => false
ps5 = Passenger.create! :user_id => 1, :trip_id => 5, :confirmed => true

#Creates ratings
ra1 = Rating.create! :comment => "Auto im schlechten Zustand!", :mark => 6, :trip_id => 1, :receiver_id => 1, :author_id => 2
ra2 = Rating.create! :comment => "Benzin?", :mark => 5, :trip_id => 2, :receiver_id => 2, :author_id => 3
ra3 = Rating.create! :comment => "Kam viel zu spät!", :mark => 4, :trip_id => 3, :receiver_id => 3, :author_id => 4
ra4 = Rating.create! :comment => "Befriedigend", :mark => 3, :trip_id => 4, :receiver_id => 4, :author_id => 5
ra5 = Rating.create! :comment => "Ist ganz gut abgelaufen!", :mark => 2, :trip_id => 5, :receiver_id => 5, :author_id => 1

#Creates requests
req1 = Request.create! :starts_at_N => 90, :starts_at_E => 90, :ends_at_N => 45, :ends_at_E => 45, :address_start => "aha straße 1 ahahausen 4564", :address_end => "aha straße 2 blahausen 4564", :start_time => Time.now-1.day, :end_time => Time.now+365.day, :baggage => true, :comment => "Hilfe", :user_id => 1
req2 = Request.create! :starts_at_N => 32, :starts_at_E => 4, :ends_at_N => 65, :ends_at_E => 4, :address_start => "aha straße 1 ahahausen 4564", :address_end => "aha straße 1 ahahausen 4564", :start_time => Time.now-1.day, :end_time => Time.now+365.day, :baggage => false, :comment => "Hilfe", :user_id => 2
req3 = Request.create! :starts_at_N => 0, :starts_at_E => 12, :ends_at_N => 45, :ends_at_E => 36, :address_start => "aha straße 1 ahahausen 4564", :address_end => "aha straße 1 ahahausen 4564", :start_time => Time.now-1.day, :end_time => Time.now+365.day, :baggage => true, :comment => "Hilfe", :user_id => 3
req4 = Request.create! :starts_at_N => 35, :starts_at_E => 45, :ends_at_N => 56, :ends_at_E => 57, :address_start => "aha straße 1 ahahausen 4564", :address_end => "aha straße 1 ahahausen 4564", :start_time => Time.now-1.day, :end_time => Time.now+365.day, :baggage => false, :comment => "Hilfe", :user_id => 4
req5 = Request.create! :starts_at_N => 65, :starts_at_E => 74, :ends_at_N => 45, :ends_at_E => 65, :address_start => "aha straße 1 ahahausen 4564", :address_end => "aha straße 1 ahahausen 4564", :start_time => Time.now-1.day, :end_time => Time.now+365.day, :baggage => true, :comment => "Hilfe", :user_id => 5

#Creates trips
tri1 = Trip.create! :user_id => 1, :car_id => 1, :starts_at_N => 54, :starts_at_E => 12, :ends_at_E => 33, :ends_at_N => 32, :address_start => "aha straße 2 ahahausen 32323", :address_end => "jkgagrkjgbjkre grbjgkbgj 45646", :start_time => Time.now-1.day, :comment => "fahf", :baggage => true
tri2 = Trip.create! :user_id => 2, :car_id => 2, :starts_at_N => 45, :starts_at_E => 13, :ends_at_E => 32, :ends_at_N => 33,:address_start => "aha straße 2 ahahausen 32323"   , :address_end => "aha straße 2 blahausen 32323"   , :start_time => Time.now-1.day, :comment => "Aha", :baggage => true
tri3 = Trip.create! :user_id => 3, :car_id => 3, :starts_at_N => 33, :starts_at_E => 55, :ends_at_E => 11, :ends_at_N => 3, :address_start => "aha straße 2 ahahausen 32323"   , :address_end => "aha straße 2 blahausen 32323", :start_time => Time.now-1.day, :comment => "ajha", :baggage => false
tri4 = Trip.create! :user_id => 4, :car_id => 4, :starts_at_N => 22, :starts_at_E => 65, :ends_at_E => 23, :ends_at_N => 2, :address_start => "aha straße 2 ahahausen 32323"   , :address_end => "aha straße 2 blahausen 32323", :start_time => Time.now-1.day, :comment => "feff", :baggage => true
tri5 = Trip.create! :user_id => 5, :car_id => 5, :starts_at_N => 11, :starts_at_E => 77, :ends_at_E => 33, :ends_at_N => 1, :address_start => "aha straße 2 ahahausen 32323"   , :address_end => "aha straße 2 blahausen 32323", :start_time => Time.now-1.day, :comment => "fefe", :baggage => false

#Creates Assoziations
user1.ignorings << user2
user1.ignorings << user3
user1.ignorings << user4

