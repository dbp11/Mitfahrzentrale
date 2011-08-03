# encoding: utf-8

#Creates 5 User
user1 = User.create! :email => "dkruempe@uos.com", :password => "dkruempe",:password_confirmation => "dkruempe", :name => "Dominik Krümpelmann", :user_type => true, :sex => true, :address => "Großer Esch 20", :addressN => 52.57975, :addressE => 8.13409, :zipcode => 48496, :phone => "054571598", :instantmessenger => "icq: 5465465", :city => "Hopsten", :email_notifications => true, :visible_phone => true, :visible_email => true, :visible_address => true, :visible_age => true, :visible_im => false, :visible_cars => true, :birthday => Date.new(1989,12,28), :visible_zip => true
user2 = User.create! :email => "mibloemer@uos.de", :password => "mibloemer",:password_confirmation => "mibloemer", :name => "Michael Blömer", :user_type => false, :sex => true, :address => "Alfred-Delp-Str. 30" , :addressN => 52.26419, :addressE => 8.014429999999999, :zipcode => 49080, :phone => "0456465", :instantmessenger => "icq: 4564644", :city => "Osnabrück", :email_notifications => false, :visible_phone => true, :visible_email => false, :visible_address => false, :visible_age => true, :visible_im => false, :visible_cars => true, :birthday => Date.new(1990,6,6), :visible_zip => false
user3 = User.create! :email => "ufischer@t-online.de", :password => "ufischer", :password_confirmation => "ufischer" ,:name => "Uwe Fischer", :user_type => true, :sex => false, :address => "Leipziger Platz 10" , :addressN => 52.50922740000001, :addressE => 13.3795693, :zipcode => 10117, :phone => "030206701034", :instantmessenger => "msn: addy@msn.com", :city => "Berlin", :email_notifications => true, :visible_phone => false, :visible_email => true, :visible_address => false, :visible_age => true, :visible_im => true, :visible_cars => false, :birthday => Date.new(1880, 12,12), :visible_zip => true
user4 = User.create! :email => "Hotel-am-Stadtring@aol.com", :password => "hotelamstadtring",:password_confirmation => "hotelamstadtring" ,:name => "Hotel am Stadtring GmbH", :user_type => true, :sex => false, :address => "Stadtring 33" , :addressN => 52.43704, :addressE => 7.062279999999999, :zipcode => 48527, :phone => "0592188330", :instantmessenger => "icq: 454654664", :city => "Lingen", :email_notifications => true, :visible_phone => true, :visible_email => false, :visible_address => true, :visible_age => false, :visible_im => true, :visible_cars => false, :birthday => Date.new(1454,1,6), :visible_zip => false
user5 = User.create! :email => "Antenne-Bayern-GmbH-&-Co.-KG@gmx.com", :password => "antenne",:password_confirmation => "antenne" ,:name => "Antenne Bayern GmbH & Co. KG ", :user_type => true, :sex => false, :address => "Münchener Straße 101C" , :addressN => 48.7428648, :addressE => 11.4344352, :zipcode => 85737, :phone => "089992770", :instantmessenger => "", :city => "Ismaning", :email_notifications => true, :visible_phone => false, :visible_email => true, :visible_address => false, :visible_age => true, :visible_im => false, :visible_cars => true, :birthday => Date.new(1898,12,12), :visible_zip => true

#Creates 5 cars
car1 = Car.create! :user_id => 1, :seats => 5, :licence => "10234", :fuel_consumption => 5.5, :smoker => true, :description => "Kein Kofferraum"
car2 = Car.create! :user_id => 2, :seats => 2, :licence => "40321", :fuel_consumption => 6.7, :smoker => false, :description => "Kofferraum verfügbar aber kein Platz"
car3 = Car.create! :user_id => 3, :seats => 3, :licence => "12345", :fuel_consumption => 8.9, :smoker => true, :description => "Auto rostet und keine Reifen"
car4 = Car.create! :user_id => 4, :seats => 4, :licence => "54321", :fuel_consumption => 11.1, :smoker => false, :description => "Test test"
car5 = Car.create! :user_id => 5, :seats => 2, :licence => "45646", :fuel_consumption => 20.3, :smoker => true, :description => "aha aha! Hier soll etwas sinnvolles stehen?"

#Creates 5 messages
msg1 = Message.create! :message => "Münster - Während der Ölmulti Aral und die münsterische Westfalen AG beginnen, E10 auch in Nordrhein-Westfalen anzubieten, bleibt der umstrittene Biosprit auf dem Markt ein Flop. Nur 20 bis 30 Prozent der Fahrer entscheiden sich nach einer Erhebung des Branchenverbands MWV für den Sprit mit dem auf zehn Prozent erhöhten Bioethanol-Anteil, wenn er an der jeweiligen Tankstelle verkauft wird.

Bundesweit griff im Juni sogar nur jeder siebte Tankstellenkunde mit Ottomotor zu E10 (13,9 Prozent), bei der Einführung im Februar waren es acht Prozent. „Allerdings wird E10 bislang nur an der Hälfte der deutschen Tankstellen angeboten“, so MWV-Sprecherin Karin Retzlaff.


In einer MWV-Befragung führten die Fahrer zuletzt am häufigsten die Sorge vor höherem Verbrauch, Angst vor Motorschäden und Zweifel an der Umweltfreundlichkeit als Gründe an. Auf Platz vier lag: „Weil ich nicht bevormundet werden will.“

Dabei sei den meisten bekannt, dass über 90 Prozent der Automodelle E10 vertrügen, meint Retzlaff. Es sei bislang kein Fall bekannt, wonach ein Auto wegen E10 ausfiel. „Es bleibt die Hoffnung, dass die Akzeptanz ansteigt“, sagt sie. E10 hatte eigentlich schon zu Jahresbeginn flächendeckend eingeführt werden sollen, dies war wegen der Kaufverweigerung gestoppt worden.

Nun setzt die Branche auf die Drei-Sorten-Strategie: Neben E10 wird das traditionelle Super (E5) sowie ein Benzin mit hoher Oktanzahl (etwa Super-Plus) angeboten. Beim ersten Anlauf war Super oft einfach durch E10 ersetzt worden.

„E10 wird die preiswerteste Benzinsorte sein“, sagt Aral-Sprecher Detlef Brandenburg. Der Preis werde etwa drei Cent unter dem von Super liegen, doch ist auch der Verbrauch bei E10 höher. „Langfristig wird E10 die meistgebrauchte Sorte werden“, glaubt er, „kurzfristig wird das nicht zu erreichen sein.“ Das sieht wohl auch Shell - neben Aral einer der Marktführer - so: Die Hamburger warten beim E10 ab. „Wir beobachten den Markt“, heißt es.
", :writer_id => 1, :receiver_id => 2, :delete_writer => false, :delete_receiver => false, :subject => "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
msg2 = Message.create! :message => "Münster - Offiziell macht das Jovel im gesamten August Betriebsferien. Am 13. August wird der Musikclub am Albersloher Weg allerdings für einen Abend seine Pforten öffnen - ausnahmsweise. Dass sich die Jovel-Homepage über die für diesen Abend geplante Party ausschweigt, mag am Veranstalter liegen: den Bandidos. Mitglieder des Motorradclubs fielen in den letzten Jahren nicht nur regelmäßig durch Gewalttaten auf, sie sollen auch tief ins Drogen- und Rotlichtmilieu verstrickt sein.

Ab 18 Uhr wollen die Bandidos-Ortsvereine Münster, Hamm und Osnabrück ihr zehnjähriges Bestehen feiern. „Ein Familienfest“, sagt Jovel-Betreiber Marvin Lindenberg. Der Eintritt ist frei, eine Band wird spielen, und für Mitternacht ist ein Feuerwerk geplant.


Dass er seine Räumlichkeiten an eine Gruppierung vermietet hat, die regelmäßig vom Verfassungsschutz beobachtet wird und seit 2010 in Schleswig-Holstein verboten ist, bereitet Lindenberg kein Kopfzerbrechen: „Das sind schließlich nicht alles Schwerverbrecher“, betont er. Natürlich habe er sich Gedanken darüber gemacht, sich die Bandidos ins Haus zu holen.

»Das sind schließlich nicht alles Schwerverbrecher«

Nach reiflicher Überlegung sei er jedoch zum Schluss gekommen, „dass wir uns keine großartigen Sorgen machen müssen“ - wenn Bandidos untereinander feiern, gehe es nämlich „stressfrei“ zu.

Was im Jovel am 13. August geplant ist, ist der Polizei „seit einiger Zeit bekannt“, bestätigt Jan Schabacker. Der Behördensprecher rechnet mit 400 Teilnehmern, geht allerdings nicht davon aus, dass die Bevölkerung viel von der Feier mitbekommt. „Es werden keine Horden von Rockern durch Münster fahren“, ist Schabacker überzeugt.

Bei anderen Polizeibehörden in NRW hat er in Erfahrung gebracht, dass „solche Veranstaltungen in der Regel völlig unspektakulär über die Bühne gehen“. Ob und in welcher Stärke die Polizei vor Ort sein wird, sei noch unklar. „Aber natürlich sind wir auf diese Geschichte vorbereitet.“

»Natürlich sind wir auf diese Geschichte vorbereitet.«

In der münsterischen Bandidos-Szene ist es laut Schabacker seit 2007 „ruhig“. Damals war an einem Rocker-Treffpunkt in Münster ein umfangreiches Waffenlager gehoben worden. Laut Polizei konnten bei den folgenden Ermittlungen Verbindungen zu Straftaten wie Waffen- und Drogenhandel sowie Gewalt-, Raub- und Eigentumsdelikten hergestellt werden. Mehrere Bandidos wurden später zu Freiheitsstrafen verurteilt.", :writer_id => 1, :receiver_id => 2, :delete_writer => true,:delete_receiver =>false, :subject => 'dfbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
msg3 = Message.create! :message => "Washington - Im US-Schuldenstreit ist nach zermürbendem Ringen ein Kompromiss gefunden. Die von beiden Seiten mit großen Zugeständnissen vereinbarte Einigung musste am Abend noch vom Kongress bestätigt werden. Im Senat wurde am Montag mit einer breiten Mehrheit gerechnet.

Im Abgeordnetenhaus gab es aber Widerstand sowohl im radikalen rechten Flügel der Republikaner als auch bei den liberalen Demokraten. Experten erwarteten dennoch, dass genügend moderate Abgeordnete auf beiden Seiten den Kompromiss absegnen werden. Die Abstimmungen wurden für die Nacht zum Dienstag (MESZ) erwartet.


Die Einigung sieht vor, dass die Erhöhung des Schuldenlimits mit historischen Sparmaßnahmen in Höhe von rund 2,5 Billionen Dollar (1,7 Billionen Euro) einhergeht. Das Weiße Haus nannte den Kompromiss am Montag einen «Sieg für das amerikanische Volk». Die Einigung beseitige «die Wolke der Unsicherheit über der US-Wirtschaft», sagte Sprecher Jay Carney. Er räumte zugleich ein, dass Präsident Barack Obama sich einen besseren Deal gewünscht hätte. Obama werde aber weiter für Steuererhöhungen für die Reichen kämpfen, versicherte Carney. Der Präsident hatte diesen Schritt im Ringen um einen Kompromiss nicht durchsetzen können.

In der Nacht zum Montag - kurz vor Ablauf der Frist für eine Erhöhung des US-Kreditrahmens am 2. August - erzielten Spitzenpolitiker der Republikaner und Demokraten den Kompromiss zur Abwendung der drohenden Staatspleite.

US-Medien hoben hervor, dass Obama und seine Demokraten die größten Zugeständnisse gemacht hätten. Dutzende der Liberalen lehnen demnach den Kompromiss ab, weil er längerfristig auch Kürzungen wichtiger Sozialprogramme bringen wird, Steuererhöhungen für die Reichen aber nicht vorgesehen sind.

Auch viele Vertreter oder Anhänger der radikal-konservativen Tea-Party-Bewegung wollten sich gegen die Vereinbarung sperren, weil sie generell gegen eine Anhebung des Schuldenlimits sind.

An der Frankfurter Börse und der Wall Street ging es mit den Kursen nach anfänglicher Euphorie drastisch abwärts. US-Konjunkturdaten, die schlechter ausfielen als erwartet, drückten auf die Stimmung.

Obama hatte den Kompromiss in der Nacht zum Montag selbst verkündet. Die Einigung erlaube es, «die Zahlungsunfähigkeit zu vermeiden und die Krise zu beenden, die Washington dem Rest der Amerikaner aufgedrückt hat», sagte der Präsident. Er nannte den Schuldenstreit einen «Schlamassel». Sprecher Carney gestand später einen «zeitweisen Zirkus» ein.

Der Kompromiss sieht vor, dass das Schuldenlimit von derzeit 14,3 Billionen Dollar (rund 10 Billionen Euro) in zwei Etappen um insgesamt bis zu 2,4 Billionen Dollar erhöht wird. Der Kongress soll zwar die Möglichkeit einer Ablehnung erhalten, aber Obama könnte dann sein Veto einlegen. Damit würden - entsprechend der Forderung des Präsidenten - vor 2013 keine weiteren Verhandlungen über den Kreditrahmen mehr nötig.

Im Gegenzug zur Erhöhung des Schuldenlimits soll es längerfristige Einsparungen in einer Gesamthöhe von rund 2,5 Billionen Dollar geben. Neben der sofortigen Festlegung auf Kürzungen von einer Billion Dollar binnen zehn Jahren soll ein Kongressausschuss bis Ende Herbst einen weiteren Sparplan im Umfang von 1,5 Billionen Dollar ausarbeiten. Dabei wird es dann auch um Einschnitte im sozialen Netz und um eine Steuerreform gehen.

Obama kündigte an, dass er in dieser zweiten Sparprogramm-Phase auch das Thema Steuererhöhungen für die Reichen erneut ins Spiel bringen will. Er bekräftigte, dass auch diese Bevölkerungsgruppe ihren Beitrag leisten müsse. «Alles wird auf den Tisch kommen.»

Verabschiedet der Kongress das zweite Paket von Sparmaßnahmen bis Ende Dezember nicht, gibt es nach diesem Kompromiss automatisch Kürzungen in allen Bereichen - Verteidigung und Sozialprogramme eingeschlossen.

Vertreter der EU und der Bundesregierung begrüßten den US-Kompromiss. In Berlin sagte Vize-Regierungssprecher Christoph Steegmans: «Die Bundesregierung ist zufrieden, dass es in den Vereinigten Staaten von Amerika eine politische Einigung in dieser schwierigen Frage gegeben hat.» Eine Sprecherin der EU-Kommission in Brüssel erklärte: «Das ist eine gute Nachricht für die europäische Wirtschaft.»
", :writer_id => 2, :receiver_id => 1, :delete_writer => false, :delete_receiver => true, :subject => 'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'
msg4 = Message.create! :message => "Ahlen - Noch glimpflich ging nach Einschätzung der Feuerwehr der Wohnungsbrand an der Jahnstraße 24 aus, zu dem der Löschzug der Hauptwache am Montagnachmittag um 15.10 Uhr mit rund 30 Kräften ausrückte.

In der Wohnung einer allein lebenden älteren Dame im 1. Obergeschoss des überwiegend von Senioren bewohnten Hauses war ein Fernseher implodiert und in Brand geraten. Eine zufällig anwesende Fußpflegerin trug das Gerät geistesgegenwärtig nach draußen auf den an das Schlafzimmer angrenzenden Balkon.


Nur Sekunden später schlugen die Flammen aus dem Fernseher und griffen um sich. Teile der Wohnungseinrichtung sowie die Balkontür, die Rollade, ein Fenster, das infolge der großen Hitzeentwicklung platzte, und eine darunter lie­gende Kunststoffverkleidung wurden nach Angaben der Polizei beschädigt.

Die Einsatzkräfte unter der Leitung von Wehrführer Walter Wolf mussten, nachdem das Feuer schnell gelöscht war, auch den Rolladenkasten aufbrechen, um mit der Wärmebildkamera nach versteckten Glutnestern zu suchen. Ein Hochleistungslüfter wurde eingesetzt, um den Qualm aus dem Haus zu pusten.

Exakt konnte der Sachschaden noch nicht beziffert werden. Doch hätte die Pflegerin nicht so gut rea­giert, lobte der stellvertretende Wachleiter Wolfram Schneider, wäre er sicher um ein Vielfaches höher ausgefallen. Die beiden Frauen blieben unverletzt und erholten sich auch recht schnell von dem Schreck.", :writer_id => 3, :receiver_id => 1, :delete_writer => false, :delete_receiver => false, :subject => nil
msg5 = Message.create! :message => "Münster - 40 Jahre nach seinem Sport- und Geografie-Studium kehrt Skateboard-Legende Titus Dittmann an die Universität Münster zurück. Zum Wintersemester 2011/2012 nimmt der 62-Jährige einen Lehrauftrag am Institut für Sportwissenschaften an. Der genaue Titel des Seminars steht zwar noch nicht fest, das Thema aber schon: „Es wird ums Skaten gehen“, sagt Dittmann. Worum auch sonst?

Die Dozentenrolle ist für den Unternehmer nicht neu. Nach erfolgreichem Lehramts-Studium hat er sechs Jahre am Hittorf-Gymnasium unterrichtet.


Der Titel seines Examensarbeit lautete übrigens „Skateboarding und Schulunterricht“: „Damit war ich der Erste, der über das Skaten eine wissenschaftliche Arbeit verfasst hat“, ist Dittmann überzeugt.

Fotostrecke
Titus Dittmann - Ein münstersches Urgestein
Zusammen mit anderen Preisträgern bekam Titus...
Titus Dittmann - Ein münstersches Urgestein
Für den Orden entledigte sich der...
Titus Dittmann - Ein münstersches Urgestein
Dittmann mit dem NRW-Minister.



Das war 1980. Mittlerweile hat sich das Skateboardfahren zu einer globalen Jugendkultur entwickelt - „der größten, die je ein Sport hervorgebracht hat“, wie der 62-Jährige betont.

Über die Gründe für diese Entwicklung will er in seinem Seminar ebenso informieren wie über den pädagogischen Nutzen, den das Skaten nach seiner Einschätzung hat. Neben der Theorie soll die Praxis nicht zu kurz kommen. So plant er, Profi-Skateboarder zum Seminar einzuladen.

Daneben will er sich mit dem Skaten „methodisch-didaktisch“ auseinandersetzen. Im Klartext: Zusammen mit seinen Studenten will er Grundlagen für Lehrer entwickeln, die Skaten im Unterricht anbieten wollen. „Bislang gibt es die nämlich noch gar nicht“, sagt der Mann, den alle nur „Titus“ nennen.

Wie lange er an der Uni bleibt, ist noch nicht heraus. „Ich kann mir gut vorstellen, dass sich das zu einem längeren Engagement entwickelt“, betont Dittmann. Was in dieser Zeit passieren könnte, spukt bereits jetzt in seinem Kopf herum. So würde er gerne eine Patenschaft zwischen der Uni Münster und der Universität im afghanischen Herat aufbauen und auch den dortigen Studierenden das Skaten näher-bringen. „Wenn sie dann anschließend irgendwo in Afghanistan arbeiten, können sie ihr Wissen an die Kinder weitergeben“, hofft Dittmann, der sich bereits seit Jahren in dem geschundenen Land engagiert.

VON MARTIN KALITSCHKE, MÜNSTER ", :writer_id => 4, :receiver_id => 1, :delete_writer => true, :delete_receiver => false, :subject => ""
msg6 = Message.create! :message => "Meinungsforschung
Große Mehrheit lehnt Rechtschreibreform noch immer ab

Die Rechtschreibreform wird auch 15 Jahre nach ihrer Einführung noch von einer deutlichen Mehrheit der Bundesbürger abgelehnt.
Die Rechtschreibreform wird auch 15 Jahre nach ihrer Einführung noch von einer deutlichen Mehrheit der Bundesbürger abgelehnt.
(Foto: dpa)


München - Die Rechtschreibreform wird auch 15 Jahre nach ihrer Einführung noch von einer deutlichen Mehrheit der Bundesbürger abgelehnt. Dies ergab eine repräsentative Umfrage im Auftrag des Nachrichtenmagazins «Focus».

Demnach wird die Reform von 1996 nur von einem Drittel der Bevölkerung begrüßt, 62 Prozent halten sie noch immer für falsch.


Das Interesse an korrekter Rechtschreibung sei ungebrochen hoch: Nur 15 Prozent halten sie für überflüssig, dagegen ist sie für 85 Prozent der Befragten wichtig. ", :writer_id => 5, :receiver_id => 1, :delete_writer => true, :delete_receiver => false, :subject => "Prominente Bankdrücker bei Bayer Leverkusen: die Nationalspieler Stephan Kießling und Michael Ballack (Zweiter und Dritter von links).Foto:"
msg7 = Message.create! :message => "Asse in der Hinterhand

Prominente Bankdrücker bei Bayer Leverkusen: die Nationalspieler Stephan Kießling und Michael Ballack (Zweiter und Dritter von links).Foto:
Prominente Bankdrücker bei Bayer Leverkusen: die Nationalspieler Stephan Kießling und Michael Ballack (Zweiter und Dritter von links).Foto:
(dpa)


Leverkusen - Der Abschied von Trainer Jupp Heynckes war für die Profis der „Werkself“ nicht leicht zu verkraften. Die meisten der jungen Spieler hatten eine funktionierende Beziehung zu ihrer „Vaterfigur“ aufgebaut. Zur Schockstarre führte das bei Bayer 04 Leverkusen aber nicht.

Mit Robin Dutt holte Sportdirektor Rudi Völler einen ambitionierten Trainer. Dutt ist kein Entertainer, kein Lautsprecher, aber ein anerkannter Fußball-Fachmann. Doch sein Einstieg ist mit dem Pokal-Aus in Dresden gehörig misslungen.


» Der unvergesslichste Moment der Saison: Als Jupp Heynckes am 30. Spieltag mit 1:5 (0:4) bei seinem neuen alten Arbeitgeber FC Bayern München unterging, war klar, dass Bayer Leverkusen den Kampf um den Titel endgültig einstellen konnte. Heynckes verschlug es die Sprache, was bei ihm selten vorkommt. Noch bemerkenswerter war allerdings, dass dieser Trainer Problemstar Michael Ballack über Wochen auf die Bank setzte, ohne dass ihm das Mobiliar und alles andere um die Ohren flog.

» Zitat der Saison: „Ich habe in den letzten Wochen erlebt: Wenn der Michael im Spiel ist, hat das eine andere Dimension“, sprach Heynckes nach dem eindrucksvollen 3:0 beim späteren Absteiger Eintracht Frankfurt. Ohne den verletzten Michael Ballack spielte Bayer am 22. Spieltag wie ein Meister. Leider lagen da schon zehn Punkte zwischen Leverkusen und Spitzenreiter Borussia Dortmund.

» So steht es um den Trainer: Der große Vorteil von Bayer Leverkusen ist, dass ein Trainer dort ruhiger und unbeobachteter arbeiten kann als in Köln oder in Schalke oder in Dortmund. Und wenn man das Training bei Bayer beobachtet, hat man unweigerlich den Eindruck, dass Robin Dutt genau der richtige ist. Dutt, der aus Freiburg kam, ist klar in seiner Argumentation und bestimmt in seinen Zielen. „Ich bin nicht nach Leverkusen gekommen, um Vierter oder Fünfter zu werden. Wir wollen besser sein als in der letzten Saison.“

» Wer ist bei den Fans umstritten? Leverkusen besitzt einen kleinen, aber qualitativ herausragenden Kader. Bei Bayer gibt es keinen ausgewiesenen „Stinkstiefel“. Die Fans wissen das.

» Des Trainers Liebling: Die Arbeit von Robin Dutt ist nicht darauf gerichtet, Lieblinge zu haben. Dafür hat der Mann zu lange im Schwabenland und in Baden gearbeitet. Ausgesprochene Wertschätzung genießt Michael Ballack. „Er ist ein Musterprofi, vorbildlich“, sagt Dutt über den ehemaligen „Capitano“.

» Innenansichten: Nach der Insolvenz von Teldafax sucht Bayer verzweifelt nach einem neuen Trikotsponsor. Aber wer will schon die Nummer zwei nach dem Bayer-Konzern sein? Die Geschäftsleitung schaltete großflächige Anzeigen in überregionalen Blättern, weitete die Akquise auch bewusst auf den asiatischen Raum aus. Greifbare Resultate: bisher Fehlanzeige. Es wird damit gerechnet, dass Bayer mit dem Schriftzug „Werkself“ in die neue Saison geht. Damit fehlen fast sieben Millionen Euro in der Kasse der Fußball GmbH. Dass der Konzern das stillschweigend ausgleicht, ist eher unwahrscheinlich.

» So wollen sie spielen: Ein Problem ist die Operationspause von Nationaltorwart René Adler. Ein weiteres, dass der Finne Sami Hyypiä seine Karriere beendet hat und Arturo Vidal zu Juventus Turin gewechselt ist. Robin Dutt setzt hohe Erwartungen in Ballack, aber auch in Gonzalo Castro, Hanno Balitsch und Simon Rolfes, im vierten Jahr Bayer-Kapitän. Folgende Aufstellung scheint wahrscheinlich: Yelldell - Balitsch, Reinartz, Toprak, Kadlec - Castro, Rolfes - Barnetta, Renato Augusto (Ballack), Schürrle - Derdiyok (Kießling).

» Das muss sich ändern: Ändern muss sich nichts. Dennoch könnte der überschaubare Kader im Hinblick auf die Champions League zu einem Problem werden. Das ist bei Bayer Leverkusen die Frage aller Fragen: Wie schafft Robin Dutt mit vergleichsweise kleiner Kopfzahl den Ritt durch Königsklasse, Pokal und Bundesliga?

» Einlauftipp: Leverkusen ist reif für den Titel. Eigentlich und ohne Zweifel. Wahrscheinlich sind die Ränge eins bis drei. Am Ende wird Bayer Dritter.", :writer_id => 1, :receiver_id => 3, :delete_writer => true, :delete_receiver => false, :subject => "Wie schafft Robin Dutt mit vergleichsweise kleiner Kopfzahl den Ritt durch Königsklasse, Pokal und Bundesliga? "
msg8 = Message.create! :message => "
FUSSBALL | 1. BUNDESLIGA
Schriftgröße:
01.08.2011
Kommentare26 Kommentare
Bundesliga-Vorschau: VfB Stuttgart
Bundesliga-Vorschau: VfB Stuttgart
Bruno Labbadia

Das Gesetz der Serie lässt nichts Gutes für die Schwaben erwarten. Seit drei Jahren heißt es beim VfB Stuttgart: Hinrunde pfui, Rückrunde hui. Ob ausgerechnet Bruno Labbadia, der bei Leverkusen und Hamburg im zweiten Jahr erfolglos blieb, diese Serie durchbrechen kann, verraten wir im 16. Teil unseres Bundesliga-Checks.

Gute Sommerzeiten

Mit Bruno Labbadia und Fredi Bobic scheint beim VfB Stuttgart Ruhe eingekehrt zu sein. Die beiden ehemaligen Stürmer arbeiten gut zusammen und verzichteten in diesem Jahr auf Sensationstransfers. Für jeden Mannschaftsteil wurde eine namhafte Verstärkung geholt. Der 29-jährige Mexikaner Maza soll die Abwehr verstärken. William Kvist kam aus Kopenhagen und soll im defensiven Mittelfeld die Fäden ziehen, Julian Schieber kehrte aus Nürnberg zurück und verstärkt den Angriff. Um auch in der Breite besser aufgestellt zu sein, ergänzen Ibrahima Traore (FC Augsburg) und die Talente Raphael Holzhauser (18), Patrick Bauer (18) und Ermin Bicakcic (21) den Kader.

Man muss sich vor Augen halten, wie es vor ein paar Wochen noch aussah. Da steckten wir mitten im Abstiegskampf. Nach so einem Jahr sollte man ein Stück weit demütig sein, rückte Bruno Labbadia die Erwartungshaltung im Club auf zeitonline.de zurecht. Der VfB Stuttgart scheint aus den Fehlern der Vergangenheit gelernt zu haben. Nach der Meisterschaft 2006/07 setzte man auf internationale Großeinkäufe. Ciprian Marica (7 Millionen Euro) und Khalid Boulahrouz (5 Millionen Euro) wurden geholt, später (09/10) auch Pavel Pogrebnyak (4,8 Millionen Euro) und Zdravko Kuzmanovic (8 Millionen Euro).

Die teuren Stars konnten die Erwartungen ebenso wenig erfüllen, wie die preiswerteren Fehleinkäufe Jan Simak, Sergiu Radu oder Mauro Camoranesi. Wir haben junge Spieler in unseren Reihen, und wir werden künftig noch mehr auf die eigene Jugend setzen, lautet die Antwort von Bruno Labbadia auf die Fehler der Vergangenheit. Allerdings fordert er Geduld beim Aufbau seines neuen Teams ein. Geduldig ist man im Haifischbecken-Bundesliga bei einem Fehlstart sicherlich nicht und der droht dem VfB, denn...

Schlechte Sommerzeiten

...dem VfB gehen die Innenverteidiger aus. In der Abwehrzentrale hatten sich in der Vorbereitung Georg Niedermeier und Serdar Tasci eingespielt. Nun fehlt der Ex-Bayer Niedermeier beim Bundesligastart nach einer Oberschenkelverletzung (min. zwei Monate Pause). Auch Tasci musste im DFB-Pokal gegen den Drittligisten SV Wehen Wiesbaden passen (Muskelverhärtung). Auf Kapitän Matthieu Delpierre (Muskelabriss) müssen die Schwaben vermutlich die ganze Hinrunde verzichten. Zu allem Überfluss verletzte sich auch noch Abwehrtalent Ermin Bicakcic (Innenbandabriss im Knie) im Pokalspiel. Für das erste Saisonspiel sind die Rekonvaleszenten Julian Schieber, Timo Gebhart und Johan Audel ebenfalls fraglich.

Neben dem Verletzungspech in der Abwehr wurde das Thema Christian Träsch ebenfalls zu einem Ärgernis der Sommerpause. Der VfB musste Träsch letztlich in Richtung Wolfsburg ziehen lassen, um ihn im nächsten Jahr nicht ablösefrei zu verlieren. Nach dem Abgang von Sami Khedira und Jens Lehmann und der hohen Verletzungsanfälligkeit von Kapitän Delpierre hätte Träsch eine wichtige Rolle als Führungsspieler einnehmen können. Ob Cacau, Christian Gentner oder Serdar Tasci in diese Rolle schlüpfen können, bleibt fraglich. Zwar mag es dem Kader an Führungsspielern fehlen, dennoch haben die Stuttgarter taktisch einige Möglichkeiten.
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

Im Sturm kämpfen Cacau, Schieber und Pogrebnyak um die Planstelle. Im defensiven Mittelfeld soll der langjährige Kapitän des FC Kopenhagen den Spielaufbau ordnen. Kvist konnte mit seinem Club im letzten Jahr bis ins Achtelfinale der Champions League vordringen. Neben ihm wird Kuzmanovic oder Christian Gentner spielen. Die Problemzone ist und bleibt die Abwehr.

Cristian Molinaro lieferte mit einer sportal.de-Durchschnittsnote 3 eine tolle Halbserie zum Bundesliga-Einstand ab (Rückrunde 09/10). Doch der Italiener konnte seine Leistung in der Hinrunde der letzten Saison nicht wiederholen, erst in der Rückrunde steigerte er sich (Notenschnitt: 3,9). Noch bedenklicher als auf der linken Abwehrposition sieht es auf der rechten Seite aus. Mit Khalid Boulahrouz und Stefano Celozzi ist der VfB im Bundesligavergleich eher in der unteren Hälfte zu finden. Das Thema Innenverteidiger spielte ja schon eine gewisse Rolle, deshalb...

Wer darf sich nicht verletzen?

...sollte sich möglichst kein weiterer Innenverteidiger auf die Verletztenliste eintragen. Noch einmal nachlegen will der VfB allerdings auch nicht. Wir werden doch keine Innenverteidiger auf Vorrat holen, wiegelt Labbadia bei diesem Thema im kicker ab. Zum Saisonstart könnte Serdar Tasci wieder fit werden und mit Maza das Innenverteidigerduo bilden. Der Mexikaner lieferte gegen Wehen Wiesbaden eine ordentliche Leistung (sportal.de-Note: 3) ab, eine gewisse Eingewöhnungszeit muss man dem 29-Jährigen, der vom PSV Eindhoven kam, allerdings noch zugestehen.

Die Tore auch beim pinkeln sehen

Die große Leidenszeit ist vorbei. Der VfB Stuttgart hat wieder ein Fußball-Wohnzimmer, in dem man sich wohlfühlen kann.Zwei Jahre lang ist auf einer Baustelle gespielt worden. Das war eine schwierige Zeit für die Fans, aber auch für die Mannschaft. Man darf das nicht unterschätzen. Das neue Stadion ist ein Quantensprung für den Verein und eine wirklich schmucke Arena, lobt Labbadia auf zeitonline.de das neue Stadion. 60.300 Zuschauer fasst die neue - zu einem reinen Fußballstadion umgebaute - Mercedes-Benz Arena. Vor allem die neue Cannstatter Kurve lässt das Fan-Herz höher schlagen. Die Argumente für die angeblich fanfreundlichste Kurve der Liga sind nicht von der Hand zu weisen.

Stefan Heim, VfB-Stab-Direktor laut pz-news.de: bei uns wird kein Fan mehr ein Tor verpassen, weil er beim Pinkeln ist. Die Pissoirs in der Cannstatter Kurve haben Scheiben mit Blick auf das Spielfeld. Die neue Arena könnte den Schwaben den einen oder anderen Extra-Punkt bescheren. Allerdings erhöht das Fußballfeinschmeckerumfeld auch die Ansprüche an offensiven, attraktiven Fußball. Bayer Leverkusen und der HSV haben unter mir teilweise begeisternden Fußball gespielt, weiß Trainer Labbadia laut zeitonline.de ins Feld zu führen. Wir möchten ihm gerne glauben, wenn da nicht die Sache mit dem Gesetz der Serie wäre.

Prognose

Bruno Labbadia hat auf seinen bisherigen Stationen in der Ersten Bundesliga im zweiten Jahr enttäuscht. Wir glauben, dass er diese Negativserie hinter sich lassen kann. Manager Fredi Bobic und der Coach haben den Kader punktuell verstärkt und mussten nur den Abgang von Träsch verschmerzen. Mit Cacau, Harnik, Schieber und Tamás Hajnal hat der VfB durchaus Offensivpotenzial zu bieten. Die Achillesferse ist und bleibt allerdings die Abwehr. So wird dem VfB ein Jahr der Konsolidierung im gesicherten Bundesliga-Mittelfeld nicht erspart bleiben. Die Schwaben landen am Ende auf Platz 8.

Michel Massing", :writer_id => 1, :receiver_id => 4, :delete_writer => true, :delete_receiver => false, :subject => "Das tapfere Schneiderlein gab die Vorlage zum Duell zwischen Eintracht Braunschweig und dem FC Bayern München, nachdem die Niedersachsen in ihrer Vereinsgeschichte bereits sechs Mal den Pokal-Favoriten zur Strecke gebracht hatten. Darunter befanden sich auch die Münchner, die im Jahr 1982 bei der 0:2-Niederlage den Kürzeren gezogen hatten.
"
msg9 = Message.create! :message => "FB-Pokal: Der FC Bayern München besiegt Eintracht Braunschweig
DFB-Pokal: Der FC Bayern München besiegt Eintracht Braunschweig
Braunschweig-Trainer Torsten Lieberknecht bekam kein Geschenk von den Bayern

Das tapfere Schneiderlein gab die Vorlage zum Duell zwischen Eintracht Braunschweig und dem FC Bayern München, nachdem die Niedersachsen in ihrer Vereinsgeschichte bereits sechs Mal den Pokal-Favoriten zur Strecke gebracht hatten. Darunter befanden sich auch die Münchner, die im Jahr 1982 bei der 0:2-Niederlage den Kürzeren gezogen hatten.

In einem flotten und offenen, aber am Ende doch einseitigen DFB-Pokalduell machten die Münchner allerdings schon in Halbzeit eins mit zwei Elfmetertreffern durch Mario Gomez (9.) und Bastian Schweinsteiger (39.) alles klar, bevor Thomas Müller, der beide Strafstöße herausgeholt hatte, den späten Schlusspunkt setzte (82.). Der Zweitligist schlug sich beachtlich, konnte jedoch kaum Gefahr nach vorne produzieren und die Bayern nicht in Verlegenheit bringen.

Keine Wechsel bei Braunschweig

Eintracht-Trainer Torsten Lieberknecht vertraute an seinem 38. Geburtstag den Spielern, die im letzten Punktspiel einen 2:0-Erfolg bei der Alemannia aus Aachen eingefahren und somit den zweiten Saisonsieg sichergestellt hatten. Denn von den Pokalhelden aus dem Jahr 1982 fühlte sich niemand mehr in der Lage, eine erneute Überraschung zu fabrizieren.

Bei den Bayern setzte Jupp Heynckes, der die DFB-Pokal-Trophäe als Trainer nur mit Mönchengladbach einmal hatte aus der Ferne bestaunen dürfen (1980 als Finalist), auf Manuel Neuer im Tor sowie Rafinha und Jerome Boateng in der Defensive. In Abwesenheit von Franck Ribery und Arjen Robben durfte erneut David Alaba von Beginn an auflaufen, der auf der anderen Seite von Müller flankiert wurde.

Dem Geburtstagskind Lieberknecht stand auf bajuwarischer Seite Schweinsteiger gegenüber, der seinen 27. Geburtstag feierte und sich später auch noch selber beschenken sollte. Zunächst eröffnete Schiedsrichter Felix Zwayer die Partie und sah gleich aggressiv auftretende Gastgeber und konzentrierte Gäste aus München. Ein geruhsamer abendlicher Spaziergang im mit lauen Temperaturen gesegneten Niedersachsen sollte es aus Sicht der Braunschweiger nicht geben, die Bayern hatten ihrerseits die leichte Schulter, auf die die Braunschweiger aufzuspringen erhofften, in der Heimat gelassen.
Weiterführende Links:

1. Pokalrunde: Ost-West-Konflikte 2011

Nackenschlag in der Früh

Das Spiel war keine zehn Minuten alt, als es den ersten Aufreger gab, der ein grimmsches Märchen direkt zum Scheitern verurteilte. Denn Ken Reichel holte Müller im Strafraum unsanft von den Beinen und dies hatte einen Strafstoß zur Folge, den Gomez dankend in den Maschen versenkte (9.). Die Eintracht hatte zu dem Zeitpunkt das Spiel zwar angenommen, doch noch keine nennenswerte eigene Aktion starten können.

Dies sollte sich auch nicht groß ändern, denn der Rekordmeister agierte klug und verstand es, den Zweitligisten vom eigenen Strafraum fernzuhalten. Einzig Dennis Kruppke hatte nach Flanke von Nico Zimmermann eine gute Gelegenheit, der Ball prallte aber von seinem Gesicht am Pfosten vorbei. In einer zumeist lebendigen Partie fehlte es zwar an der erhofften Spannung, dafür gab es einen weiteren Elfmeter zu sehen, als Braunschweig sich gerade anschickte, eine Art Ebenbürtigkeit zu entwickeln.
zurück
Stimmen zum Spiel: 1/3
Dennis Kruppke: Wir brauchen da nicht groß drumherum reden: Wir haben heute die Grenzen aufgezeigt bekommen. Die Bayern waren mindestens eine Klasse besser als wir.
vor

Diesmal war es Mirko Boland, der Müller im Sechzehner ungeschickt umrempelte und Schweinsteiger so zu einem Geburtstagsgeschenk in Form des 2:0 verhalf. Ein erneutes Märchen, das am 16. Oktober 1982 beim 2:0-Erfolg gegen jene Münchner seine ersten Zeilen geschrieben hatte und fünf Fortsetzungen produzierte, schien mit dem Halbzeitpfiff von Zwayer undenkbar und die Sieben auf mehrere Streiche kein möglicher Bestseller in der Fußball-Bücherei.

Bayern bleiben dominant

Die Zuschauer hatten trotz des Rückstands ihren Spaß an der Begegnung, die im zweiten Durchgang keine große Wendung nahm. Die Bayern dominierten und hatten durch Alaba (56.) und Gomez (58.) weitere Möglichkeiten, während Zimmermann und Kruppke für temporäres Raunen im weiten Rund des Eintracht-Stadions sorgten.

Spielerisch ging nichts mehr für Braunschweig und da auch die Standards nicht unbedingt für offene Brände im Abwehrverbund der Bayern sorgten, blieb die Hoffnung der einzige Freund der Gastgeber, der den Anschlusstreffer noch nicht völlig ins Reich der Utopie verbannen wollte. Doch Souveränität blieb der zweite Vorname der Mannschaft von Jupp Heynckes, die nicht im entferntesten die Lust verspürten, es hier noch einmal Spannend zu machen.

Als Müller nach zwei herausgeholten Strafstößen dann unnachahmlich zum 3:0 einlupfte, war die Messe gelesen und der Deckel auf der Geschichte. Somit gab es keine neue Pokalsensation und die Gewissheit, dass eine gute Geschichte noch lange nicht das Zeug zu einem Märchen hat.

Gunnar Beuth
", :writer_id => 1, :receiver_id => 5, :delete_writer => true, :delete_receiver => false, :subject => "Somit gab es keine neue Pokalsensation und die Gewissheit, dass eine gute Geschichte noch lange nicht das Zeug zu einem Märchen hat."
msg10 = Message.create! :message => "NiFakt: Der FC Chelsea ist weiter auf der Suche nach Verstärkungen für die Offensive, vor allem die Kreativität im Mittelfeld soll erhöht werden. Deshalb galt lange Zeit Luka Modric von Tottenham als Favorit, doch die Spurs weigern sich. Das scheint sich auch nach der erneuten Erhöhung des Angebots auf 34 Millionen Euro nicht zu ändern. Nun könnte es zu einer Planänderung kommen, die Roman Abramovich einen seiner Lieblingsspieler bescheren würde.

Gerücht: Kaka verlässt Real Madrid und wechselt zum FC Chelsea.

Wahrheitsgehalt: Maximal: 15% Gerüchte über einen Wechsel von Kaka zum FC Chelsea gibt es, seit Abramovich bei den Blues das Sagen hat. Nun könnte wieder Bewegung in die Sache kommen, denn nach Informationen der spanischen Zeitung Sport denkt Real über einen Verkauf von Kaka nach, auch wenn die damals investierten 65 Millionen Euro keinesfalls zu erzielen sind. Kaka selbst will sich bei den Königlichen eigentlich durchsetzen. Die Vorbereitung hat bis jetzt aber gezeigt, dass ein Stammplatz sehr unwahrscheinlich ist. So soll Chelsea bereit sein, 30 Millionen Euro zu zahlen. Real hätte so die Möglichkeit, einen weiteren Stürmer zu verpflichten, wie es Trainer José Mourinho schon länger fordert.
l", :writer_id => 2, :receiver_id => 1, :delete_writer => true, :delete_receiver => false, :subject => "Somit gab es keine neue Pokalsensation und die Gewissheit, dass eine gute Geschichte noch lange nicht das Zeug zu einem Märchen hat."
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
req1 = Request.new :starts_at_N => 48.1391265, :starts_at_E => 11.5801863, :ends_at_N => 52.2766061, :ends_at_E => 7.43844030000001, :address_start => "München", :address_end => "Rheine", :start_time => Time.now-1.day, :end_time => Time.now+365.day, :baggage => true, :comment => "Hilfe", :user_id => 1, :start_radius => 31, :end_radius => 37
req2 = Request.new :starts_at_N => 48.1391265, :starts_at_E => 11.581863, :ends_at_N => 53.074981, :ends_at_E => 8.807081, :address_start => "München", :address_end => "Bremen", :start_time => Time.now-1.day, :end_time => Time.now+365.day, :baggage => false, :comment => "Hilfe", :user_id => 2, :start_radius => 12, :end_radius => 15
req3 = Request.new :starts_at_N => 52.6875079, :starts_at_E => 7.2911623, :ends_at_N => 52.267281, :ends_at_E => 8.0531882, :address_start => "Meppen", :address_end => "Osnabrück", :start_time => Time.now-1.day, :end_time => Time.now+365.day, :baggage => true, :comment => "Hilfe", :user_id => 3, :start_radius => 43, :end_radius => 22
req4 = Request.new :starts_at_N => 53.553813, :starts_at_E => 9.91586, :ends_at_N => 52.5234051, :ends_at_E => 13.4113999, :address_start => "Hamburg", :address_end => "Berlin", :start_time => Time.now-1.day, :end_time => Time.now+365.day, :baggage => false, :comment => "Hilfe", :user_id => 4, :start_radius => 12, :end_radius => 32
req5 = Request.new :starts_at_N => 52.4025974, :starts_at_E => 7.6408948, :ends_at_N => 52.2766061, :ends_at_E => 7.438440300000001, :address_start => "Rheine", :address_end => "Hopsten-Halverde", :start_time => Time.now-1.day, :end_time => Time.now+365.day, :baggage => true, :comment => "Hilfe", :user_id => 5, :start_radius => 12, :end_radius=> 46
req1.set_route
req2.set_route
req3.set_route
req4.set_route
req5.set_route
req1.save
req2.save
req3.save
req4.save
req5.save
#Creates trips
tri1 = Trip.new :user_id => 1, :car_id => 1, :starts_at_N => 52.27133, :starts_at_E => 7.4452, :ends_at_E => 8.13409, :ends_at_N => 52.57975, :address_start => "Hafenbahn 10 48431 Rheine", :address_end => "Großer Esch 20 48496 Hopsten", :start_time => Time.now-1.day, :comment => "Biete eine Fahrt an!", :baggage => true, :free_seats => 5
tri2 = Trip.new :user_id => 2, :car_id => 2, :starts_at_N => 48.1391265, :starts_at_E => 11.5801863, :ends_at_E => 8.807081, :ends_at_N => 53.074981,:address_start => "München" , :address_end => "Bremen" , :start_time => Time.now-1.day, :comment => "Platz für alle :D!", :baggage => true, :free_seats => 4
tri3 = Trip.new :user_id => 3, :car_id => 3, :starts_at_N => 53.553813, :starts_at_E => 9.991586, :ends_at_E => 13.4113999, :ends_at_N => 52.523401, :address_start => "Hamburg" , :address_end => "Berlin", :start_time => Time.now-1.day, :comment => "Ahoi", :baggage => false, :free_seats => 3
tri4 = Trip.new :user_id => 4, :car_id => 4, :starts_at_N => 52.2766061, :starts_at_E => 7.43840300000001, :ends_at_E => 7.3237899999999, :ends_at_N => 52.52306, :address_start => "Rheine" , :address_end => "Lingen", :start_time => Time.now-1.day, :comment => "Boom Boom", :baggage => true, :free_seats => 5
tri5 = Trip.new :user_id => 5, :car_id => 5, :starts_at_N => 52.6875079, :starts_at_E => 7.2911623, :ends_at_E => 8.0531882, :ends_at_N => 52.267281, :address_start => "Meppen" , :address_end => "Osnabrück", :start_time => Time.now-1.day, :comment => "Schnell schnell!", :baggage => false, :free_seats => 4
tri1.set_route
tri2.set_route
tri3.set_route
tri4.set_route
tri5.set_route
tri1.save
tri2.save
tri3.save
tri4.save
tri5.save

#Creates Assoziations
user1.ignorings << user2
user1.ignorings << user3
user1.ignorings << user4
