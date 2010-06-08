module Openfooty

  class Community
    include HTTParty
    base_uri "http://api.openfooty.org/1.0/community."
    
    attr_reader :api_key
     
    # Usage
    # Openfooty::Community.new("getDFTable").fetch
    # Openfooty::Community.new("getFanIQTable").fetch
    # Openfooty::Community.new("getFanValTable).fetch
    # Openfooty::Community.new("getForumThreads").fetch
    # Openfooty::Community.new("getLatestUsers").fetch
    # Openfooty::Community.new("getUserData").fetch
    
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