module Openfooty
  
  class Client
    include HTTParty
    base_uri "http://api.openfooty.org/1.0"
    format :xml
  
    attr_reader :api_key
  
    # Usage
    # openfooty = Openfooty::Client.new 
    # openfooty.team("getFixtures", :team_id => "id")
    # openfooty.match("getStats", :match_id => "id")
    
    # Other API methods here: http://www.footytube.com/openfooty/karma.php         
  
    def initialize(options={})
      @api_key = options[:api_key] || Openfooty.api_key
    end
  
    def auth(method, options={})
      mashup(self.class.get("/auth.#{method}", :query => options.merge(self.default_options)))
    end
  
    def betting(method, options={})
      mashup(self.class.get("/betting.#{method}", :query => options.merge(self.default_options)))
    end
  
    def channel(method, options={})
      mashup(self.class.get("/channel.#{method}", :query => options.merge(self.default_options)))
    end
    
    def community(method, options={})
      mashup(self.class.get("/community.#{method}", :query => options.merge(self.default_options)))
    end
    
    def league(method, options={})
      mashup(self.class.get("/league.#{method}", :query => options.merge(self.default_options)))
    end
    
    def match(method, options={})
      mashup(self.class.get("/match.#{method}", :query => options.merge(self.default_options)))
    end
    
    def player(method, options={})
      mashup(self.class.get("/player.#{method}", :query => options.merge(self.default_options)))
    end
    
    def team(method, options={})
      mashup(self.class.get("/team.#{method}", :query => options.merge(self.default_options)))
    end
    
    def video(method, options={})
      mashup(self.class.get("/video.#{method}", :query => options.merge(self.default_options)))
    end
  
    protected
  
    def default_options
      {:api_key => @api_key}
    end
    
    def mashup(response)
       case response.code
         when 200
           if response.is_a?(Hash)
             Hashie::Mash.new(response)
           else
             if response.first.is_a?(Hash)
               response.map{|item| Hashie::Mash.new(item)}
             else
               response
             end
           end
         end
       end
     end

end