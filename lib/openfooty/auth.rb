module Openfooty

  class Auth
    include HTTParty
    base_uri "http://api.openfooty.org/1.0/auth."
    
    attr_reader :api_key
    
    # Usage
    # Openfooty::Auth.new("getQuota").fetch            
    
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