# encoding: utf-8

#Creates 5 User
user1 = User.new :email => "dkruempe@uos.com", :password => "dkruempe",:password_confirmation => "dkruempe", :name => "Dominik Krümpelmann", :user_type => true, :sex => true, :address => "Großer Esch 20", :addressN => 52.57975, :addressE => 8.13409, :zipcode => 48496, :phone => "054571598", :instantmessenger => "icq: 5465465", :city => "Hopsten", :email_notifications => true, :visible_phone => true, :visible_email => true, :visible_address => true, :visible_age => true, :visible_im => false, :visible_cars => true, :birthday => Date.new(1989,12,28), :visible_zip => true, :user_type => false, :visible_city => true, :business => false
user2 = User.new :email => "mibloemer@uos.de", :password => "mibloemer",:password_confirmation => "mibloemer", :name => "Michael Blömer", :user_type => false, :sex => true, :address => "Alfred-Delp-Str. 30" , :addressN => 52.26419, :addressE => 8.014429999999999, :zipcode => 49080, :phone => "0456465", :instantmessenger => "icq: 4564644", :city => "Osnabrück", :email_notifications => false, :visible_phone => true, :visible_email => false, :visible_address => false, :visible_age => true, :visible_im => false, :visible_cars => true, :birthday => Date.new(1990,6,6), :visible_zip => false, :user_type => false, :visible_city => true, :business => false
user3 = User.new :email => "ufischer@t-online.de", :password => "ufischer", :password_confirmation => "ufischer" ,:name => "Uwe Fischer", :user_type => true, :sex => false, :address => "Leipziger Platz 10" , :addressN => 52.50922740000001, :addressE => 13.3795693, :zipcode => 10117, :phone => "030206701034", :instantmessenger => "msn: addy@msn.com", :city => "Berlin", :email_notifications => true, :visible_phone => false, :visible_email => true, :visible_address => false, :visible_age => true, :visible_im => true, :visible_cars => false, :birthday => Date.new(1880, 12,12), :visible_zip => true,:user_type => false, :visible_city => true, :business => false
user4 = User.new :email => "Hotel-am-Stadtring@aol.com", :password => "hotelamstadtring",:password_confirmation => "hotelamstadtring" ,:name => "Hotel am Stadtring GmbH", :user_type => true, :sex => false, :address => "Stadtring 33" , :addressN => 52.43704, :addressE => 7.062279999999999, :zipcode => 48527, :phone => "0592188330", :instantmessenger => "icq: 454654664", :city => "Lingen", :email_notifications => true, :visible_phone => true, :visible_email => false, :visible_address => true, :visible_age => false, :visible_im => true, :visible_cars => false, :birthday => Date.new(1454,1,6), :visible_zip => false,:user_type => false, :visible_city => true, :business => true
user5 = User.new :email => "Antenne-Bayern-GmbH-&-Co.-KG@gmx.com", :password => "antenne",:password_confirmation => "antenne" ,:name => "Antenne Bayern GmbH & Co. KG ", :user_type => true, :sex => false, :address => "Münchener Straße 101C" , :addressN => 48.7428648, :addressE => 11.4344352, :zipcode => 85737, :phone => "089992770", :instantmessenger => "", :city => "Ismaning", :email_notifications => true, :visible_phone => false, :visible_email => true, :visible_address => false, :visible_age => true, :visible_im => false, :visible_cars => true, :birthday => Date.new(1898,12,12), :visible_zip => true,:user_type => false, :visible_city => true, :business => true

#Creates 5 cars
car1 = Car.new :user_id => 1, :seats => 5, :licence => "10234", :price_km => 5.5, :smoker => true, :description => "Kein Kofferraum", :car_type => "BMW"
car2 = Car.new :user_id => 2, :seats => 2, :licence => "40321", :price_km => 6.7, :smoker => false, :description => "Kofferraum verfügbar aber kein Platz", :car_type => "Mercedes"
car3 = Car.new :user_id => 3, :seats => 3, :licence => "12345", :price_km => 8.9, :smoker => true, :description => "Auto rostet und keine Reifen", :car_type => "Ford"
car4 = Car.new :user_id => 4, :seats => 4, :licence => "54321", :price_km => 11.1, :smoker => false, :description => "Test test", :car_type => "Porsche"
car5 = Car.new :user_id => 5, :seats => 2, :licence => "45646", :price_km => 20.3, :smoker => true, :description => "aha aha! Hier soll etwas sinnvolles stehen?", :car_type => "VW"
#Creates 5 messages
msg1 = Message.new :message => "Münster - Während der Ölmulti Aral und die münsterische Westfalen AG beginnen, E10 auch in Nordrhein-Westfalen anzubieten, bleibt der umstrittene Biosprit auf dem Markt ein Flop. Nur 20 bis 30 Prozent der Fahrer entscheiden sich nach einer Erhebung des Branchenverbands MWV für den Sprit mit dem auf zehn Prozent erhöhten Bioethanol-Anteil, wenn er an der jeweiligen Tankstelle verkauft wird.

„E10 wird die preiswerteste Benzinsorte sein“, sagt Aral-Sprecher Detlef Brandenburg. Der Preis werde etwa drei Cent unter dem von Super liegen, doch ist auch der Verbrauch bei E10 höher. „Langfristig wird E10 die meistgebrauchte Sorte werden“, glaubt er, „kurzfristig wird das nicht zu erreichen sein.“ Das sieht wohl auch Shell - neben Aral einer der Marktführer - so: Die Hamburger warten beim E10 ab. „Wir beobachten den Markt“, heißt es.
", :writer_id => 1, :receiver_id => 2, :delete_writer => false, :delete_receiver => false, :subject => "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
msg2 = Message.new :message => "Münster - Offiziell macht das Jovel im gesamten August Betriebsferien. Am 13. August wird der Musikclub am Albersloher Weg allerdings für einen Abend seine Pforten öffnen - ausnahmsweise. Dass sich die Jovel-Homepage über die für diesen Abend geplante Party ausschweigt, mag am Veranstalter liegen: den Bandidos. Mitglieder des Motorradclubs fielen in den letzten Jahren nicht nur regelmäßig durch Gewalttaten auf, sie sollen auch tief ins Drogen- und Rotlichtmilieu verstrickt sein.

Ab 18 Uhr wollen die Bandidos-Ortsvereine Münster, Hamm und Osnabrück ihr zehnjähriges Bestehen feiern. „Ein Familienfest“, sagt Jovel-Betreiber Marvin Lindenberg. Der Eintritt ist frei, eine Band wird spielen, und für Mitternacht ist ein Feuerwerk geplant.
Bei anderen Polizeibehörden in NRW hat er in Erfahrung gebracht, dass „solche Veranstaltungen in der Regel völlig unspektakulär über die Bühne gehen“. Ob und in welcher Stärke die Polizei vor Ort sein wird, sei noch unklar. „Aber natürlich sind wir auf diese Geschichte vorbereitet.“

»Natürlich sind wir auf diese Geschichte vorbereitet.«

In der münsterischen Bandidos-Szene ist es laut Schabacker seit 2007 „ruhig“. Damals war an einem Rocker-Treffpunkt in Münster ein umfangreiches Waffenlager gehoben worden. Laut Polizei konnten bei den folgenden Ermittlungen Verbindungen zu Straftaten wie Waffen- und Drogenhandel sowie Gewalt-, Raub- und Eigentumsdelikten hergestellt werden. Mehrere Bandidos wurden später zu Freiheitsstrafen verurteilt.", :writer_id => 1, :receiver_id => 2, :delete_writer => true,:delete_receiver =>false, :subject => 'dfbbbbbbbbbbbbbbbbbbbbbb'
msg3 = Message.new :message => "Washington - Im US-Schuldenstreit ist nach zermürbendem Ringen ein Kompromiss gefunden. Die von beiden Seiten mit großen Zugeständnissen vereinbarte Einigung musste am Abend noch vom Kongress bestätigt werden. Im Senat wurde am Montag mit einer breiten Mehrheit gerechnet.

Im Abgeordnetenhaus gab es aber Widerstand sowohl im radikalen rechten Flügel der Republikaner als auch bei den liberalen Demokraten. Experten erwarteten dennoch, dass genügend moderate Abgeordnete auf beiden Seiten den Kompromiss absegnen werden. Die Abstimmungen wurden für die Nacht zum Dienstag (MESZ) erwartet.

Verabschiedet der Kongress das zweite Paket von Sparmaßnahmen bis Ende Dezember nicht, gibt es nach diesem Kompromiss automatisch Kürzungen in allen Bereichen - Verteidigung und Sozialprogramme eingeschlossen.

Vertreter der EU und der Bundesregierung begrüßten den US-Kompromiss. In Berlin sagte Vize-Regierungssprecher Christoph Steegmans: «Die Bundesregierung ist zufrieden, dass es in den Vereinigten Staaten von Amerika eine politische Einigung in dieser schwierigen Frage gegeben hat.» Eine Sprecherin der EU-Kommission in Brüssel erklärte: «Das ist eine gute Nachricht für die europäische Wirtschaft.»
", :writer_id => 2, :receiver_id => 1, :delete_writer => false, :delete_receiver => true, :subject => 'fffffffffffffffffff'
msg4 = Message.new :message => "Ahlen - Noch glimpflich ging nach Einschätzung der Feuerwehr der Wohnungsbrand an der Jahnstraße 24 aus, zu dem der Löschzug der Hauptwache am Montagnachmittag um 15.10 Uhr mit rund 30 Kräften ausrückte.

Die Einsatzkräfte unter der Leitung von Wehrführer Walter Wolf mussten, nachdem das Feuer schnell gelöscht war, auch den Rolladenkasten aufbrechen, um mit der Wärmebildkamera nach versteckten Glutnestern zu suchen. Ein Hochleistungslüfter wurde eingesetzt, um den Qualm aus dem Haus zu pusten.

Exakt konnte der Sachschaden noch nicht beziffert werden. Doch hätte die Pflegerin nicht so gut rea­giert, lobte der stellvertretende Wachleiter Wolfram Schneider, wäre er sicher um ein Vielfaches höher ausgefallen. Die beiden Frauen blieben unverletzt und erholten sich auch recht schnell von dem Schreck.", :writer_id => 3, :receiver_id => 1, :delete_writer => false, :delete_receiver => false, :subject => "fedfe"
msg5 = Message.new :message => "Münster - 40 Jahre nach seinem Sport- und Geografie-Studium kehrt Skateboard-Legende Titus Dittmann an die Universität Münster zurück. Zum Wintersemester 2011/2012 nimmt der 62-Jährige einen Lehrauftrag am Institut für Sportwissenschaften an. Der genaue Titel des Seminars steht zwar noch nicht fest, das Thema aber schon: „Es wird ums Skaten gehen“, sagt Dittmann. Worum auch sonst?

Die Dozentenrolle ist für den Unternehmer nicht neu. Nach erfolgreichem Lehramts-Studium hat er sechs Jahre am Hittorf-Gymnasium unterrichtet.


Der Titel seines Examensarbeit lautete übrigens „Skateboarding und Schulunterricht“: „Damit war ich der Erste, der über das Skaten eine wissenschaftliche Arbeit verfasst hat“, ist Dittmann überzeugt.
VON MARTIN KALITSCHKE, MÜNSTER", :writer_id => 4, :receiver_id => 1, :delete_writer => true, :delete_receiver => false, :subject => "feffe"
msg6 = Message.new :message => "Meinungsforschung
Große Mehrheit lehnt Rechtschreibreform noch immer ab

Die Rechtschreibreform wird auch 15 Jahre nach ihrer Einführung noch von einer deutlichen Mehrheit der Bundesbürger abgelehnt.
Die Rechtschreibreform wird auch 15 Jahre nach ihrer Einführung noch von einer deutlichen Mehrheit der Bundesbürger abgelehnt.
(Foto: dpa)


München - Die Rechtschreibreform wird auch 15 Jahre nach ihrer Einführung noch von einer deutlichen Mehrheit der Bundesbürger abgelehnt. Dies ergab eine repräsentative Umfrage im Auftrag des Nachrichtenmagazins «Focus».

Demnach wird die Reform von 1996 nur von einem Drittel der Bevölkerung begrüßt, 62 Prozent halten sie noch immer für falsch.


Das Interesse an korrekter Rechtschreibung sei ungebrochen hoch: Nur 15 Prozent halten sie für überflüssig, dagegen ist sie für 85 Prozent der Befragten wichtig. ", :writer_id => 5, :receiver_id => 1, :delete_writer => true, :delete_receiver => false, :subject => "Prominente Bankdrücker bei Bayer "
msg7 = Message.new :message => "Asse in der Hinterhand

» So wollen sie spielen: Ein Problem ist die Operationspause von Nationaltorwart René Adler. Ein weiteres, dass der Finne Sami Hyypiä seine Karriere beendet hat und Arturo Vidal zu Juventus Turin gewechselt ist. Robin Dutt setzt hohe Erwartungen in Ballack, aber auch in Gonzalo Castro, Hanno Balitsch und Simon Rolfes, im vierten Jahr Bayer-Kapitän. Folgende Aufstellung scheint wahrscheinlich: Yelldell - Balitsch, Reinartz, Toprak, Kadlec - Castro, Rolfes - Barnetta, Renato Augusto (Ballack), Schürrle - Derdiyok (Kießling).

» Das muss sich ändern: Ändern muss sich nichts. Dennoch könnte der überschaubare Kader im Hinblick auf die Champions League zu einem Problem werden. Das ist bei Bayer Leverkusen die Frage aller Fragen: Wie schafft Robin Dutt mit vergleichsweise kleiner Kopfzahl den Ritt durch Königsklasse, Pokal und Bundesliga?

» Einlauftipp: Leverkusen ist reif für den Titel. Eigentlich und ohne Zweifel. Wahrscheinlich sind die Ränge eins bis drei. Am Ende wird Bayer Dritter.", :writer_id => 1, :receiver_id => 3, :delete_writer => true, :delete_receiver => false, :subject => "Wie schafft Robini"
msg8 = Message.new :message => "
Weiterführende Links:

Bundesliga-Vorschau: Mainz 05
Bundesliga-Vorschau: Kaiserslautern
Bundesliga-Vorschau: Nürnberg
Bundesliga-Vorschau: HSV
Bundesliga-Vorschau: 1. FC Köln
Bundesliga-Vorschau: Hertha BSC
Bundesliga-Vorschau: VfL Wolfsburg
Bundesliga-Vorschau: SC Freiburg
Bundesliga-Vorschau: Bayer Leverkusen
Bundesliga-Vorschau: 1899 Hoffenheim
Bundesliga-Vorschau: FC Augsburg
Bundesliga-Vorschau: FC Schalke
Bundesliga-Vorschau: Werder Bremen
Bundesliga-Vorschau: Hannover 96
Bundesliga-Vorschau: Gladbach

Bruno Labbadia arbeitete mit seinem Team zunächst weiter am Erfolgssystem aus der Rückrunde. Neben dem 4-2-3-1 hat der Trainer aber auch eine Art 4-1-3-2 einstudiert. Wir wollen variabel sein, auf verschiedene Situationen reagieren können. Das hängt gar nicht so sehr vom Gegner ab, sondern vor allem von unseren Spielern, erklärte Labbadia auf bundesliga.de. Mit Johan Audel, Timo Gebhart, Traoré, Shinji Okazaki und Martin Harnik hat der Trainer einige Optionen für die offensiven Außenpositionen.
icht erspart bleiben. Die Schwaben landen am Ende auf Platz 8.

Michel Massing", :writer_id => 1, :receiver_id => 4, :delete_writer => true, :delete_receiver => false, :subject => "Das tapfere Schneiderlein gab die Vorlage zum Duell zwischen Eintracht Braunschweig und dem"
msg9 = Message.new :message => "FB-Pokal: Der FC Bayern München besiegt Eintracht Braunschweig

Bayern bleiben dominant

Die Zuschauer hatten trotz des Rückstands ihren Spaß an der Begegnung, die im zweiten Durchgang keine große Wendung nahm. Die Bayern dominierten und hatten durch Alaba (56.) und Gomez (58.) weitere Möglichkeiten, während Zimmermann und Kruppke für temporäres Raunen im weiten Rund des Eintracht-Stadions sorgten.

Spielerisch ging nichts mehr für Braunschweig und da auch die Standards nicht unbedingt für offene Brände im Abwehrverbund der Bayern sorgten, blieb die Hoffnung der einzige Freund der Gastgeber, der den Anschlusstreffer noch nicht völlig ins Reich der Utopie verbannen wollte. Doch Souveränität blieb der zweite Vorname der Mannschaft von Jupp Heynckes, die nicht im entferntesten die Lust verspürten, es hier noch einmal Spannend zu machen.

Als Müller nach zwei herausgeholten Strafstößen dann unnachahmlich zum 3:0 einlupfte, war die Messe gelesen und der Deckel auf der Geschichte. Somit gab es keine neue Pokalsensation und die Gewissheit, dass eine gute Geschichte noch lange nicht das Zeug zu einem Märchen hat.

Gunnar Beuth
", :writer_id => 1, :receiver_id => 5, :delete_writer => true, :delete_receiver => false, :subject => "Somit gab es keine neue Pokalsensation und"
msg10 = Message.new :message => "NiFakt: Der FC Chelsea ist weiter auf der Suche nach Verstärkungen für die Offensive, vor allem die Kreativität im Mittelfeld soll erhöht werden. Deshalb galt lange Zeit Luka Modric von Tottenham als Favorit, doch die Spurs weigern sich. Das scheint sich auch nach der erneuten Erhöhung des Angebots auf 34 Millionen Euro nicht zu ändern. Nun könnte es zu einer Planänderung kommen, die Roman Abramovich einen seiner Lieblingsspieler bescheren würde.

Gerücht: Kaka verlässt Real Madrid und wechselt zum FC Chelsea.

Wahrheitsgehalt: Maximal: 15% Gerüchte über einen Wechsel von Kaka zum FC Chelsea gibt es, seit Abramovich bei den Blues das Sagen hat. Nun könnte wieder Bewegung in die Sache kommen, denn nach Informationen der spanischen Zeitung Sport denkt Real über einen Verkauf von Kaka nach, auch wenn die damals investierten 65 Millionen Euro keinesfalls zu erzielen sind. Kaka selbst will sich bei den Königlichen eigentlich durchsetzen. Die Vorbereitung hat bis jetzt aber gezeigt, dass ein Stammplatz sehr unwahrscheinlich ist. So soll Chelsea bereit sein, 30 Millionen Euro zu zahlen. Real hätte so die Möglichkeit, einen weiteren Stürmer zu verpflichten, wie es Trainer José Mourinho schon länger fordert.
l", :writer_id => 2, :receiver_id => 1, :delete_writer => true, :delete_receiver => false, :subject => "Somit  "

#Creates passenger
ps1 = Passenger.new :user_id => 2, :trip_id => 1, :confirmed => true
ps2 = Passenger.new :user_id => 3, :trip_id => 2, :confirmed => false
ps3 = Passenger.new :user_id => 4, :trip_id => 3, :confirmed => true
ps4 = Passenger.new :user_id => 5, :trip_id => 4, :confirmed => false
ps5 = Passenger.new :user_id => 1, :trip_id => 5, :confirmed => true
ps6 = Passenger.new :user_id => 3, :trip_id => 4, :confirmed => true
ps7 = Passenger.new :user_id => 1, :trip_id => 2, :confirmed => true
ps8 = Passenger.new :user_id => 1, :trip_id => 3, :confirmed => true
ps9 = Passenger.new :user_id => 1, :trip_id => 4, :confirmed => true
ps10 = Passenger.new :user_id => 2, :trip_id => 3, :confirmed => true

#Creates ratings
ra1 = Rating.new :comment => "Auto im schlechten Zustand!", :mark => 6, :trip_id => 1, :receiver_id => 1, :author_id => 2
ra2 = Rating.new :comment => "Benzin?", :mark => 5, :trip_id => 2, :receiver_id => 2, :author_id => 3
ra3 = Rating.new :comment => "Kam viel zu spät!", :mark => 4, :trip_id => 3, :receiver_id => 3, :author_id => 4
ra4 = Rating.new :comment => "Befriedigend", :mark => 3, :trip_id => 4, :receiver_id => 4, :author_id => 5
ra5 = Rating.new :comment => "Ist ganz gut abgelaufen!", :mark => 2, :trip_id => 5, :receiver_id => 5, :author_id => 1

#Creates request
req1 = Request.new :starts_at_N => 48.1391265, :starts_at_E => 11.5801863, :ends_at_N => 52.2766061, :ends_at_E => 7.43844030000001, :address_start => "München", :address_end => "Rheine", :start_time => Time.now+1.day, :end_time => Time.now+365.day, :baggage => true, :comment => "Hilfe", :user_id => 1, :start_radius => 31, :end_radius => 37
req2 = Request.new :starts_at_N => 48.1391265, :starts_at_E => 11.581863, :ends_at_N => 53.074981, :ends_at_E => 8.807081, :address_start => "München", :address_end => "Bremen", :start_time => Time.now+1.day, :end_time => Time.now+365.day, :baggage => false, :comment => "Hilfe", :user_id => 2, :start_radius => 12, :end_radius => 15
req3 = Request.new :starts_at_N => 52.6875079, :starts_at_E => 7.2911623, :ends_at_N => 52.267281, :ends_at_E => 8.0531882, :address_start => "Meppen", :address_end => "Osnabrück", :start_time => Time.now+1.day, :end_time => Time.now+365.day, :baggage => true, :comment => "Hilfe", :user_id => 3, :start_radius => 43, :end_radius => 22
req4 = Request.new :starts_at_N => 53.553813, :starts_at_E => 9.91586, :ends_at_N => 52.5234051, :ends_at_E => 13.4113999, :address_start => "Hamburg", :address_end => "Berlin", :start_time => Time.now+1.day, :end_time => Time.now+365.day, :baggage => false, :comment => "Hilfe", :user_id => 4, :start_radius => 12, :end_radius => 32
req5 = Request.new :starts_at_N => 52.4025974, :starts_at_E => 7.6408948, :ends_at_N => 52.2766061, :ends_at_E => 7.438440300000001, :address_start => "Rheine", :address_end => "Hopsten-Halverde", :start_time => Time.now+1.day, :end_time => Time.now+365.day, :baggage => true, :comment => "Hilfe", :user_id => 5, :start_radius => 12, :end_radius=> 46
req1.set_route
req2.set_route
req3.set_route
req4.set_route
req5.set_route
#Creates trips
tri1 = Trip.new :user_id => 1, :car_id => 1, :starts_at_N => 52.27133, :starts_at_E => 7.4452, :ends_at_E => 8.13409, :ends_at_N => 52.57975, :address_start => "Hafenbahn 10 48431 Rheine", :address_end => "Großer Esch 20 48496 Hopsten", :start_time => Time.now+1.day, :comment => "Biete eine Fahrt an!", :baggage => true, :free_seats => 5
tri2 = Trip.new :user_id => 2, :car_id => 2, :starts_at_N => 48.1391265, :starts_at_E => 11.5801863, :ends_at_E => 8.807081, :ends_at_N => 53.074981,:address_start => "München" , :address_end => "Bremen" , :start_time => Time.now+1.day, :comment => "Platz für alle :D!", :baggage => true, :free_seats => 4
tri3 = Trip.new :user_id => 3, :car_id => 3, :starts_at_N => 53.553813, :starts_at_E => 9.991586, :ends_at_E => 13.4113999, :ends_at_N => 52.523401, :address_start => "Hamburg" , :address_end => "Berlin", :start_time => Time.now+1.day, :comment => "Ahoi", :baggage => false, :free_seats => 3
tri4 = Trip.new :user_id => 4, :car_id => 4, :starts_at_N => 52.2766061, :starts_at_E => 7.43840300000001, :ends_at_E => 7.3237899999999, :ends_at_N => 52.52306, :address_start => "Rheine" , :address_end => "Lingen", :start_time => Time.now+1.day, :comment => "Boom Boom", :baggage => true, :free_seats => 5
tri5 = Trip.new :user_id => 5, :car_id => 5, :starts_at_N => 52.6875079, :starts_at_E => 7.2911623, :ends_at_E => 8.0531882, :ends_at_N => 52.267281, :address_start => "Meppen" , :address_end => "Osnabrück", :start_time => Time.now+1.day, :comment => "Schnell schnell!", :baggage => false, :free_seats => 4
tri1.set_route
tri2.set_route
tri3.set_route
tri4.set_route
tri5.set_route
user1.save!
user2.save!
user3.save!
user4.save!
user5.save!
msg1.save!
msg2.save!
msg3.save!
msg4.save!
msg5.save!
msg6.save!
msg7.save!
msg8.save!
msg9.save!
msg10.save!
car1.save!
car2.save!
car3.save!
car4.save!
car5.save!
req1.save!
req2.save!
req3.save!
req4.save!
req5.save!
tri1.save!
tri2.save!
tri3.save!
tri4.save!
tri5.save!
ra1.save!
ra2.save!
ra3.save!
ra4.save!
ra5.save!
ps1.save!
ps2.save!
ps3.save!
ps4.save!
ps5.save!
ps6.save!
ps7.save!
ps8.save!
ps9.save!
ps10.save!
#Creates Assoziations
user1.ignorings << user2
user1.ignorings << user3
user1.ignorings << user4
