# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
car1 = Car.create! :user_id => , :seats => , :licence => , :fuel_consumption => , :smoker => , :description =>
car2 = Car.create! :user_id => , :seats => , :licence => , :fuel_consumption => , :smoker => , :description =>
car3 = Car.create! :user_id => , :seats => , :licence => , :fuel_consumption => , :smoker => , :description =>
car4 = Car.create! :user_id => , :seats => , :licence => , :fuel_consumption => , :smoker => , :description =>
car5 = Car.create! :user_id => , :seats => , :licence => , :fuel_consumption => , :smoker => , :description =>

msg1 = Message.create! :message => , :writer_id => , :receiver_id =>
msg2 = Message.create! :message => , :writer_id => , :receiver_id =>
msg3 = Message.create! :message => , :writer_id => , :receiver_id =>
msg4 = Message.create! :message => , :writer_id => , :receiver_id =>
msg5 = Message.create! :message => , :writer_id => , :receiver_id =>

ps1 = Passenger.create! :user_id => , :trip_id => , :confirmed =>
ps2 = Passenger.create! :user_id => , :trip_id => , :confirmed =>
ps3 = Passenger.create! :user_id => , :trip_id => , :confirmed =>
ps4 = Passenger.create! :user_id => , :trip_id => , :confirmed =>
ps5 = Passenger.create! :user_id => , :trip_id => , :confirmed =>

ra1 = Rating.create! :comment => , :mark => , :trip_id => , :receiver_id => , :author_id =>
ra2 = Rating.create! :comment => , :mark => , :trip_id => , :receiver_id => , :author_id =>
ra3 = Rating.create! :comment => , :mark => , :trip_id => , :receiver_id => , :author_id =>
ra4 = Rating.create! :comment => , :mark => , :trip_id => , :receiver_id => , :author_id =>
ra5 = Rating.create! :comment => , :mark => , :trip_id => , :receiver_id => , :author_id =>

req1 = Request.create! :starts_at_N => , :starts_at_E => , :ends_at_N => , :ends_at_E => , :address_start => , :address_end => , :start_time => , :end_time => , :baggage => , :comment => , :user_id =>
req2 = Request.create! :starts_at_N => , :starts_at_E => , :ends_at_N => , :ends_at_E => , :address_start => , :address_end => , :start_time => , :end_time => , :baggage => , :comment => , :user_id =>
req3 = Request.create! :starts_at_N => , :starts_at_E => , :ends_at_N => , :ends_at_E => , :address_start => , :address_end => , :start_time => , :end_time => , :baggage => , :comment => , :user_id =>
req4 = Request.create! :starts_at_N => , :starts_at_E => , :ends_at_N => , :ends_at_E => , :address_start => , :address_end => , :start_time => , :end_time => , :baggage => , :comment => , :user_id =>
req5 = Request.create! :starts_at_N => , :starts_at_E => , :ends_at_N => , :ends_at_E => , :address_start => , :address_end => , :start_time => , :end_time => , :baggage => , :comment => , :user_id =>

tri1 = Trip.create! :user_id => , :car_id => , :starts_at_N => , :starts_at_E => , :ends_at_E => , :ends_at_N => , :address_start => , :address_end => , :start_time => , :comment => , :baggage =>
tri2 = Trip.create! :user_id => , :car_id => , :starts_at_N => , :starts_at_E => , :ends_at_E => , :ends_at_N => , :address_start => , :address_end => , :start_time => , :comment => , :baggage =>
tri3 = Trip.create! :user_id => , :car_id => , :starts_at_N => , :starts_at_E => , :ends_at_E => , :ends_at_N => , :address_start => , :address_end => , :start_time => , :comment => , :baggage =>
tri4 = Trip.create! :user_id => , :car_id => , :starts_at_N => , :starts_at_E => , :ends_at_E => , :ends_at_N => , :address_start => , :address_end => , :start_time => , :comment => , :baggage =>
tri5 = Trip.create! :user_id => , :car_id => , :starts_at_N => , :starts_at_E => , :ends_at_E => , :ends_at_N => , :address_start => , :address_end => , :start_time => , :comment => , :baggage =>

user1 = User.create! :email => , :encrypted_password => , :reset_password_token => , :reset_password_sent_at  => , :remember_created_at => , :sign_in_count => , :current_sign_in_at => , :last_sign_in_at => , :current_sign_in_ip => , :last_sign_in_ip => , :name => , :user_type => , :sex => , :address => , :addressN => , :addressE => , :zipcode =>, :phone =>, :instantmessenger => , :city => , :email_notifications => , :visible_phone => , :visible_email => , :visible_address => , :visible_age => , :visible_im => , :visible_cars => , :birthday => , :role => , :visible_zip =>
user2 = User.create! :email => , :encrypted_password => , :reset_password_token => , :reset_password_sent_at  => , :remember_created_at => , :sign_in_count => , :current_sign_in_at => , :last_sign_in_at => , :current_sign_in_ip => , :last_sign_in_ip => , :name => , :user_type => , :sex => , :address => , :addressN => , :addressE => , :zipcode =>, :phone =>, :instantmessenger => , :city => , :email_notifications => , :visible_phone => , :visible_email => , :visible_address => , :visible_age => , :visible_im => , :visible_cars => , :birthday => , :role => , :visible_zip =>
user3 = User.create! :email => , :encrypted_password => , :reset_password_token => , :reset_password_sent_at  => , :remember_created_at => , :sign_in_count => , :current_sign_in_at => , :last_sign_in_at => , :current_sign_in_ip => , :last_sign_in_ip => , :name => , :user_type => , :sex => , :address => , :addressN => , :addressE => , :zipcode =>, :phone =>, :instantmessenger => , :city => , :email_notifications => , :visible_phone => , :visible_email => , :visible_address => , :visible_age => , :visible_im => , :visible_cars => , :birthday => , :role => , :visible_zip =>
user4 = User.create! :email => , :encrypted_password => , :reset_password_token => , :reset_password_sent_at  => , :remember_created_at => , :sign_in_count => , :current_sign_in_at => , :last_sign_in_at => , :current_sign_in_ip => , :last_sign_in_ip => , :name => , :user_type => , :sex => , :address => , :addressN => , :addressE => , :zipcode =>, :phone =>, :instantmessenger => , :city => , :email_notifications => , :visible_phone => , :visible_email => , :visible_address => , :visible_age => , :visible_im => , :visible_cars => , :birthday => , :role => , :visible_zip =>
user5 = User.create! :email => , :encrypted_password => , :reset_password_token => , :reset_password_sent_at  => , :remember_created_at => , :sign_in_count => , :current_sign_in_at => , :last_sign_in_at => , :current_sign_in_ip => , :last_sign_in_ip => , :name => , :user_type => , :sex => , :address => , :addressN => , :addressE => , :zipcode =>, :phone =>, :instantmessenger => , :city => , :email_notifications => , :visible_phone => , :visible_email => , :visible_address => , :visible_age => , :visible_im => , :visible_cars => , :birthday => , :role => , :visible_zip =>

user = User.create! :name => 'First User', :email => 'user@test.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name
