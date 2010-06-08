# Openfooty
gem 'httparty'
require 'httparty'

directory = File.expand_path(File.dirname(__FILE__))

module Openfooty
  
  # create config/initializers/openfooty.rb
  # 
  # Openfooty.configure do |config|
  #   config.api_key = 'api_key'
  #   config.api_type = 'api_type'
  # end
  # client = Openfooty::Client.new
  #
  # or
  #
  # Openfooty.api_key = 'api_key'
  # Openfooty.api_type = 'api_type'
  #
  # or
  #
  # Openfooty::Client.new(:api_key => 'api_key', :api_type => 'api_type')
  
  def self.configure
    yield self
    true
  end

  class << self
    attr_accessor :api_key
    attr_accessor :api_type
  end
  
end

require File.join(directory, 'openfooty', 'auth')
require File.join(directory, 'openfooty', 'betting')
require File.join(directory, 'openfooty', 'channel')
require File.join(directory, 'openfooty', 'community')
require File.join(directory, 'openfooty', 'league')
require File.join(directory, 'openfooty', 'match')
require File.join(directory, 'openfooty', 'player')
require File.join(directory, 'openfooty', 'team')
require File.join(directory, 'openfooty', 'video')