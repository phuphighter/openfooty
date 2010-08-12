require 'helper'

class OpenfootyTest < Test::Unit::TestCase
  
  context "Openfooty API" do
    
    setup do
      @client = Openfooty::Client.new(:api_key => 'openfootyapikey')
    end

    should "return a list of fixtures for given league_id" do
      stub_get("http://api.openfooty.org/1.0/league.getFixtures?league_id=72&api_key=openfootyapikey", "league_fixtures.xml")
      league_fixtures = @client.league("getFixtures", :league_id => 72).openfooty.fixtures.match
      league_fixtures.size.should == 20
      league_fixtures.first.home_team.should == 'South Africa'
      league_fixtures.first.away_team.should == 'Mexico'
    end
    
    should "return a team squad members for a given team_id" do
      stub_get("http://api.openfooty.org/1.0/team.getSquad?api_key=openfootyapikey&team_id=2281", "team_squad.xml")
      team_squad = @client.team("getSquad", :team_id => 2281).openfooty.players.player
      team_squad.size.should == 31
      team_squad.first.should == 'B. Bradley'
    end
    
    should "return a list of stats for a given match_id" do
      stub_get("http://api.openfooty.org/1.0/match.getStats?match_id=781512&api_key=openfootyapikey", "match_stats.xml")
      match_stats = @client.match("getStats", :match_id => 781512).openfooty.match
      match_stats.home_team.assists.assist.size.should == 2
      match_stats.home_team.assists.assist.last.player_name.should == 'T. Cahill'
    end

  end

end