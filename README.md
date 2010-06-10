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
    >> fixtures = openfooty.league("getFixtures", :league_id => 72).openfooty.fixtures.match
    >> fixtures.first.home_team
    => "South Africa"
    
    >> stats = openfooty.match("getStats", :match_id => 781512).openfooty.match
    >> stats.home_team.assists.assist.last.player_name
    => "T. Cahill"
    

## Copyright

Contact me if you have any suggestions and feel free to fork it!

Copyright (c) 2009 Johnny Khai Nguyen, released under the MIT license
