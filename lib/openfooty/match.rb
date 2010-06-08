module Openfooty

  class Match
    include HTTParty
    base_uri "http://api.openfooty.org/1.0/match."
    
    attr_reader :api_key
     
    # Usage
    # Openfooty::Match.new("getComments", :match_id => "id").fetch
    # Openfooty::Match.new("getGoalsOfTheWeek").fetch
    # Openfooty::Match.new("getGuardianCommentary", :match_id => "id", :guardian_api_key => "").fetch
    # Openfooty::Match.new("getGuardianMatchReport", :match_id => "id", :guardian_api_key => "").fetch
    # Openfooty::Match.new("getMostExciting").fetch
    # Openfooty::Match.new("getMostPopular").fetch
    # Openfooty::Match.new("getPhotos", :match_id => "id").fetch
    # Openfooty::Match.new("getStats", :match_id => "id").fetch
    # Openfooty::Match.new("getVideos", :match_id => "id").fetch
        
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