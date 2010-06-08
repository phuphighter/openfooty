module Openfooty

  class Team
    include HTTParty
    base_uri "http://api.openfooty.org/1.0/team."
    
    attr_reader :api_key
     
    # Usage
    # Openfooty::Team.new("getBadge", :team_id => "id").fetch
    # Openfooty::Team.new("getBlogs", :team_id => "id").fetch
    # Openfooty::Team.new("getComments", :team_id => "id").fetch
    # Openfooty::Team.new("getFans", :team_id => "id").fetch
    # Openfooty::Team.new("getFixtures", :team_id => "id").fetch
    # Openfooty::Team.new("getGuardianEditorial", :team_id => "id", :guardian_api_key => "").fetch
    # Openfooty::Team.new("getGuardianMedia", :team_id => "id", :guardian_api_key => "").fetch
    # Openfooty::Team.new("getInjuredPlayers", :team_id => "id").fetch
    # Openfooty::Team.new("getNews", :team_id => "id").fetch
    # Openfooty::Team.new("getPhotos", :team_id => "id").fetch
    # Openfooty::Team.new("getPodcasts", :team_id => "id").fetch
    # Openfooty::Team.new("getQuotes", :team_id => "id").fetch
    # Openfooty::Team.new("getResults", :team_id => "id").fetch
    # Openfooty::Team.new("getSquad", :team_id => "id").fetch
    # Openfooty::Team.new("getStats", :league_id => "id", :team_id => "id").fetch
    # Openfooty::Team.new("getVideos", :team_id => "id").fetch
    # Openfooty::Team.new("getWiki", :team_id => "id").fetch
        
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