# Openfooty

This is a Ruby wrapper for the [Openfooty API](http://www.footytube.com/openfooty/karma.php).

## Installation

As a gem:

    sudo gem install openfooty

As a plugin (in your Rails directory:

    script/plugin install git://github.com/phuphighter/openfooty.git
    
## Get a Openfooty API key

Sign up for a Openfooty API key: [http://www.footytube.com/openfooty/signup.php](http://www.footytube.com/openfooty/signup.php)
    
## Usage

### Configure

    >> Openfooty.api_key = "your_api_key" or Openfooty::Client.new(:api_key => "your_api_key")
    
### or in an initializer

    >> Openfooty.configure do |config|
    >>   config.api_key = 'your_api_key'
    >> end
    
#### Examples

    >> openfooty = Openfooty::Client.new
    >> openfooty.team("getSquad", :team_id => 2281)
    => {"openfooty"=>{"players"=>{"player"=>[{"position"=>"", "cdata"=>"B. Bradley", "id"=>"130156"}, {"position"=>"Goalkeeper", "cdata"=>"B. Guzan", "id"=>"6912"}, {"position"=>"Goalkeeper", "cdata"=>"M. Hahnemann", "id"=>"629"}, {"position"=>"Goalkeeper", "cdata"=>"T. Howard", "id"=>"632"}, {"position"=>"Defender", "cdata"=>"C. Bocanegra", "id"=>"643"}, {"position"=>"Defender", "cdata"=>"J. Bornstein", "id"=>"6906"}, {"position"=>"Defender", "cdata"=>"S. Cherundolo", "id"=>"104666"}, {"position"=>"Defender", "cdata"=>"J. DeMerit", "id"=>"2541"}, {"position"=>"Defender", "cdata"=>"C. Goodson", "id"=>"7261"}, {"position"=>"Defender", "cdata"=>"C. Marshall", "id"=>"7214"}, {"position"=>"Defender", "cdata"=>"O. Onyewu", "id"=>"655"}, {"position"=>"Defender", "cdata"=>"H. Pearce", "id"=>"16404"}, {"position"=>"Defender", "cdata"=>"J. Spector", "id"=>"2712"}, {"position"=>"Midfielder", "cdata"=>"D. Beasley", "id"=>"659"}, {"position"=>"Midfielder", "cdata"=>"A. Bedoya", "id"=>"76707"}, {"position"=>"Midfielder", "cdata"=>"M. Bradley", "id"=>"2304"}, {"position"=>"Midfielder", "cdata"=>"R. Clark", "id"=>"10049"}, {"position"=>"Midfielder", "cdata"=>"C. Dempsey", "id"=>"664"}, {"position"=>"Midfielder", "cdata"=>"L. Donovan", "id"=>"666"}, {"position"=>"Midfielder", "cdata"=>"M. Edu", "id"=>"7452"}, {"position"=>"Midfielder", "cdata"=>"B. Feilhaber", "id"=>"2008"}, {"position"=>"Midfielder", "cdata"=>"S. Holden", "id"=>"7305"}, {"position"=>"Midfielder", "cdata"=>"S. Kljestan", "id"=>"6915"}, {"position"=>"Midfielder", "cdata"=>"R. Rogers", "id"=>"7226"}, {"position"=>"Midfielder", "cdata"=>"J. Torres", "id"=>"14359"}, {"position"=>"Attacker", "cdata"=>"J. Altidore", "id"=>"7422"}, {"position"=>"Attacker", "cdata"=>"E. Buddle", "id"=>"7445"}, {"position"=>"Attacker", "cdata"=>"B. Ching", "id"=>"673"}, {"position"=>"Attacker", "cdata"=>"R. Findley", "id"=>"7345"}, {"position"=>"Attacker", "cdata"=>"H. Gómez", "id"=>"6937"}, {"position"=>"Attacker", "cdata"=>"E. Johnson", "id"=>"674"}], "team_id"=>"2281"}, "response"=>{"status"=>"ok"}, "version"=>"1.0"}}
    
    >> openfooty.match("getStats", :match_id => 781532)
    => {"openfooty"=>{"version"=>"1.0", "match"=>{"home_team"=>{"name"=>{"cdata"=>"Everton"}, "goals"=>{"goal"=>{"player_name"=>"D. Bilyaletdinov", "time"=>90, "player_id"=>6472, "type"=>"normal"}, "count"=>1}, "cards"=>{"count"=>0}, "assists"=>{"count"=>1, "assist"=>{"player_name"=>"J. Heitinga", "time"=>90, "player_id"=>17}}, "id"=>"674", "lineup"=>{"player"=>[{"cdata"=>"T. Howard", "id"=>632}, {"cdata"=>"L. Baines", "id"=>2672}, {"cdata"=>"P. Jagielka", "id"=>2600}, {"cdata"=>"T. Hibbert", "id"=>2868}, {"cdata"=>"S. Distin", "id"=>2846}, {"cdata"=>"M. Arteta", "id"=>2876}, {"cdata"=>"S. Pienaar", "id"=>1960}, {"cdata"=>"L. Osman", "id"=>2880}, {"cdata"=>"J. Rodwell", "id"=>23173}, {"cdata"=>"V. Anichebe", "id"=>2886}, {"cdata"=>"L. Saha", "id"=>552}], "substitution"=>[{"cdata"=>"A. Yakubu for J. Rodwell (55)", "player_id_on"=>"2839", "player_id_off"=>"23173"}, {"cdata"=>"D. Bilyaletdinov for V. Anichebe (66)", "player_id_on"=>"6472", "player_id_off"=>"2886"}, {"cdata"=>"J. Heitinga for M. Arteta (84)", "player_id_on"=>"17", "player_id_off"=>"2876"}]}}, "winner"=>{"cdata"=>"674"}, "date"=>{"cdata"=>"2010-05-09 15:00:00"}, "away_team"=>{"name"=>{"cdata"=>"Portsmouth"}, "goals"=>{"count"=>0}, "cards"=>{"count"=>0}, "assists"=>{"count"=>0}, "id"=>"673", "lineup"=>{"player"=>[{"cdata"=>"J. Ashdown", "id"=>2638}, {"cdata"=>"M. Wilson", "id"=>22852}, {"cdata"=>"A. Mokoena", "id"=>2687}, {"cdata"=>"Ricardo Rocha", "id"=>4531}, {"cdata"=>"A. Vanden Borre", "id"=>4585}, {"cdata"=>"S. Finnan", "id"=>2966}, {"cdata"=>"Bouba Diop", "id"=>2751}, {"cdata"=>"H. Mullins", "id"=>2722}, {"cdata"=>"K. Boateng", "id"=>1870}, {"cdata"=>"F. Piquionne", "id"=>1328}, {"cdata"=>"J. Utaka", "id"=>1471}], "substitution"=>[{"cdata"=>"J. O'Hara for M. Wilson (45)", "player_id_on"=>"5888", "player_id_off"=>"22852"}, {"cdata"=>"T. Ben Haim for A. Mokoena (66)", "player_id_on"=>"2625", "player_id_off"=>"2687"}, {"cdata"=>"A. Basinas for F. Piquionne (77)", "player_id_on"=>"3605", "player_id_off"=>"1328"}]}}, "status"=>{"cdata"=>"Played"}, "score"=>{"cdata"=>"1-0"}, "ht_score"=>{"cdata"=>"0-0"}}}}
    

## Copyright

Contact me if you have any suggestions and feel free to fork it!

Copyright (c) 2009 Johnny Khai Nguyen, released under the MIT license
