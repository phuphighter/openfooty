module Openfooty

  class League
    include HTTParty
    base_uri "http://api.openfooty.org/1.0/league."
    
    attr_reader :api_key
     
    # Usage
    # Openfooty::League.new("getBadge", :league_id => 8).fetch
    # Openfooty::League.new("getComments", :league_id => 8).fetch
    # Openfooty::League.new("getFixtures", :league_id => 8).fetch
    # Openfooty::League.new("getGuardianEditorial", :league_id => 8, :guardian_api_key => "").fetch
    # Openfooty::League.new("getIdents", :league_id => 8).fetch
    # Openfooty::League.new("getInjuredPlayers", :league_id => 8).fetch
    # Openfooty::League.new("getPhotos"), :league_id => 8.fetch
    # Openfooty::League.new("getPlayerStats", :league_id => 8).fetch
    # Openfooty::League.new("getResults", :league_id => 8).fetch
    # Openfooty::League.new("getTable", :league_id => 8).fetch
    # Openfooty::League.new("getTeams", :league_id => 8).fetch
    # Openfooty::League.new("getVideos", :league_id => 8).fetch
        
    def initialize(name, options={})
      @name = name
      @api_key = options[:api_key] || Openfooty.api_key
      @options = options
    end
    
    def fetch
      response = self.class.get("#{@name}", :query => @options.merge(self.default_options))
    end
    
    protected
    
    def default_options
      {:api_key => @api_key, :format => :json}
    end
  end
  
end