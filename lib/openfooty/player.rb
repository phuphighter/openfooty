module Openfooty

  class Player
    include HTTParty
    base_uri "http://api.openfooty.org/1.0/player."
    
    attr_reader :api_key
     
    # Usage
    # Openfooty::Player.new("getDreamFootyStats", :player_id => "id").fetch
    # Openfooty::Player.new("getProfilePhoto", :player_id => "id").fetch
    # Openfooty::Player.new("getQuotes", :player_id => "id").fetch
    # Openfooty::Player.new("getStats", :league_id => :player_id => "id").fetch
        
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