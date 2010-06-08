module Openfooty

  class Video
    include HTTParty
    base_uri "http://api.openfooty.org/1.0/video."
    
    attr_reader :api_key
     
    # Usage
    # Openfooty::Video.new("getCompilations").fetch
    # Openfooty::Video.new("getLatest").fetch
    # Openfooty::Video.new("getNews").fetch
        
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