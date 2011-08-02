# encoding: utf-8

#Creates 5 User
user1 = User.create! :email => "dkruempe@uos.com", :password => "dkruempe",:password_confirmation => "dkruempe", :name => "Dominik Krümpelmann", :user_type => true, :sex => true, :address => "Großer Esch 20", :addressN => 52.57975, :addressE => 8.13409, :zipcode => 48496, :phone => "054571598", :instantmessenger => "icq: 5465465", :city => "Hopsten", :email_notifications => true, :visible_phone => true, :visible_email => true, :visible_address => true, :visible_age => true, :visible_im => false, :visible_cars => true, :birthday => Date.new(1989,12,28), :visible_zip => true
user2 = User.create! :email => "mibloemer@uos.de", :password => "mibloemer",:password_confirmation => "mibloemer", :name => "Michael Blömer", :user_type => false, :sex => true, :address => "Alfred-Delp-Str. 30"   , :addressN => 52.26419, :addressE => 8.014429999999999, :zipcode => 49080, :phone => "0456465", :instantmessenger => "icq: 4564644", :city => "Osnabrück", :email_notifications => false, :visible_phone => true, :visible_email => false, :visible_address => false, :visible_age => true, :visible_im => false, :visible_cars => true, :birthday => Date.new(1990,6,6), :visible_zip => false
user3 = User.create! :email => "ufischer@t-online.de", :password => "ufischer", :password_confirmation => "ufischer" ,:name => "Uwe Fischer", :user_type => true, :sex => false, :address => "Leipziger Platz 10"   , :addressN => 52.50922740000001, :addressE => 13.3795693, :zipcode => 10117, :phone => "030206701034", :instantmessenger => "msn: addy@msn.com", :city => "Berlin", :email_notifications => true, :visible_phone => false, :visible_email => true, :visible_address => false, :visible_age => true, :visible_im => true, :visible_cars => false, :birthday => Date.new(1880, 12,12), :visible_zip => true
user4 = User.create! :email => "Hotel-am-Stadtring@aol.com", :password => "hotelamstadtring",:password_confirmation => "hotelamstadtring" ,:name => "Hotel am Stadtring GmbH", :user_type => true, :sex => false, :address => "Stadtring 33"   , :addressN => 52.43704, :addressE => 7.062279999999999, :zipcode => 48527, :phone => "0592188330", :instantmessenger => "icq: 454654664", :city => "Lingen", :email_notifications => true, :visible_phone => true, :visible_email => false, :visible_address => true, :visible_age => false, :visible_im => true, :visible_cars => false, :birthday => Date.new(1454,1,6), :visible_zip => false
user5 = User.create! :email => "Antenne-Bayern-GmbH-&-Co.-KG@gmx.com", :password => "antenne",:password_confirmation => "antenne" ,:name => "Antenne Bayern GmbH & Co. KG ", :user_type => true, :sex => false, :address => "Münchener Straße 101C"   , :addressN => 48.7428648, :addressE => 11.4344352, :zipcode => 85737, :phone => "089992770", :instantmessenger => "", :city => "Ismaning", :email_notifications => true, :visible_phone => false, :visible_email => true, :visible_address => false, :visible_age => true, :visible_im => false, :visible_cars => true, :birthday => Date.new(1898,12,12), :visible_zip => true

#Creates 5 cars
car1 = Car.create! :user_id => 1, :seats => 5, :licence => "10234", :fuel_consumption => 5.5, :smoker => true, :description => "Kein Kofferraum"
car2 = Car.create! :user_id => 2, :seats => 2, :licence => "40321", :fuel_consumption => 6.7, :smoker => false, :description => "Kofferraum verfügbar aber kein Platz"
car3 = Car.create! :user_id => 3, :seats => 3, :licence => "12345", :fuel_consumption => 8.9, :smoker => true, :description => "Auto rostet und keine Reifen"
car4 = Car.create! :user_id => 4, :seats => 4, :licence => "54321", :fuel_consumption => 11.1, :smoker => false, :description => "Test test"
car5 = Car.create! :user_id => 5, :seats => 2, :licence => "45646", :fuel_consumption => 20.3, :smoker => true, :description => "aha aha! Hier soll etwas sinnvolles stehen?"

#Creates 5 messages
msg1 = Message.create! :message => "Man man man, dass war ein Trip ;)!", :writer_id => 1, :receiver_id => 2, :delete_writer => false, :delete_receiver => false
msg2 = Message.create! :message => "Oje Oje!", :writer_id => 2, :receiver_id => 3, :delete_writer => true,:delete_receiver =>false
msg3 = Message.create! :message => "nbajgggsr", :writer_id => 3, :receiver_id => 4, :delete_writer => false, :delete_receiver => true
msg4 = Message.create! :message => "Bam", :writer_id => 4, :receiver_id => 5, :delete_writer => false, :delete_receiver => false
msg5 = Message.create! :message => "Nil", :writer_id => 5, :receiver_id => 1, :delete_writer => true, :delete_receiver => false

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

#Creates request
req1 = Request.create! :starts_at_N => 48.1391265, :starts_at_E => 11.5801863, :ends_at_N => 52.2766061, :ends_at_E => 7.43844030000001, :address_start => "Müchen", :address_end => "Rheine", :start_time => Time.now-1.day, :end_time => Time.now+365.day, :baggage => true, :comment => "Hilfe", :user_id => 1
req2 = Request.create! :starts_at_N => 48.1391265, :starts_at_E => 11.581863, :ends_at_N => 53.074981, :ends_at_E => 8.807081, :address_start => "München", :address_end => "Bremen", :start_time => Time.now-1.day, :end_time => Time.now+365.day, :baggage => false, :comment => "Hilfe", :user_id => 2
req3 = Request.create! :starts_at_N => 52.6875079, :starts_at_E => 7.2911623, :ends_at_N => 52.267281, :ends_at_E => 8.0531882, :address_start => "Meppen", :address_end => "Osnbrück", :start_time => Time.now-1.day, :end_time => Time.now+365.day, :baggage => true, :comment => "Hilfe", :user_id => 3
req4 = Request.create! :starts_at_N => 53.553813, :starts_at_E => 9.91586, :ends_at_N => 52.5234051, :ends_at_E => 13.4113999, :address_start => "Hamburg", :address_end => "Berlin", :start_time => Time.now-1.day, :end_time => Time.now+365.day, :baggage => false, :comment => "Hilfe", :user_id => 4
req5 = Request.create! :starts_at_N => 52.4025974, :starts_at_E => 7.6408948, :ends_at_N => 52.2766061, :ends_at_E => 7.438440300000001, :address_start => "Rheine", :address_end => "Hopsten-Halverde", :start_time => Time.now-1.day, :end_time => Time.now+365.day, :baggage => true, :comment => "Hilfe", :user_id => 5

#Creates trips
tri1 = Trip.create! :user_id => 1, :car_id => 1, :starts_at_N => 52.27133, :starts_at_E => 7.4452, :ends_at_E => 8.13409, :ends_at_N => 52.57975, :address_start => "Hafenbahn 10 48431 Rheine", :address_end => "Großer Esch 20 48496 Hopsten", :start_time => Time.now-1.day, :comment => "Biete eine Fahrt an!", :baggage => true, :free_seats => 5
tri2 = Trip.create! :user_id => 2, :car_id => 2, :starts_at_N => 48.1391265, :starts_at_E => 11.5801863, :ends_at_E => 8.807081, :ends_at_N => 53.074981,:address_start => "München"   , :address_end => "Bremen"   , :start_time => Time.now-1.day, :comment => "Platz für alle :D!", :baggage => true, :free_seats => 4
tri3 = Trip.create! :user_id => 3, :car_id => 3, :starts_at_N => 53.553813, :starts_at_E => 9.991586, :ends_at_E => 13.4113999, :ends_at_N => 52.523401, :address_start => "Hamburg"   , :address_end => "Berlin", :start_time => Time.now-1.day, :comment => "Ahoi", :baggage => false, :free_seats => 3
tri4 = Trip.create! :user_id => 4, :car_id => 4, :starts_at_N => 52.2766061, :starts_at_E => 7.43840300000001, :ends_at_E => 7.3237899999999, :ends_at_N => 52.52306, :address_start => "Rheine"   , :address_end => "Lingen", :start_time => Time.now-1.day, :comment => "Boom Boom", :baggage => true, :free_seats => 5
tri5 = Trip.create! :user_id => 5, :car_id => 5, :starts_at_N => 52.6875079, :starts_at_E => 7.2911623, :ends_at_E => 8.0531882, :ends_at_N => 52.267281, :address_start => "Meppen"   , :address_end => "Osnabrück", :start_time => Time.now-1.day, :comment => "Schnell schnell!", :baggage => false, :free_seats => 4

#Creates Assoziations
user1.ignorings << user2
user1.ignorings << user3
user1.ignorings << user4
