require 'spec_helper'

describe Openfooty::Client do
  
  context "request team squad members by team_id" do
    use_vcr_cassette 'team_squad'
    
    it "should return a team squad members for a given team_id" do
      @client = Openfooty::Client.new(:api_key => "9b3ce44cc6a223d3803f0c1350083816")      
      team_squad = @client.team("getSquad", :team_id => 2281).openfooty.players.player
      team_squad.size.should == 33
      team_squad.first.should == 'B. Bradley'
    end
  end
  
  context "request status by match_id" do
    use_vcr_cassette 'match_status'
    
    it "should return a list of stats for a given match_id" do
      @client = Openfooty::Client.new(:api_key => "9b3ce44cc6a223d3803f0c1350083816")
      match_stats = @client.match("getStats", :match_id => 781512).openfooty.match
      match_stats.home_team.assists.assist.size.should == 2
      match_stats.home_team.assists.assist.last.player_name.should == 'T. Cahill'
    end
  end

end