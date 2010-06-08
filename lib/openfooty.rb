# Openfooty
gem 'httparty'
require 'httparty'
require 'hashie'

directory = File.expand_path(File.dirname(__FILE__))

Hash.send :include, Hashie::HashExtensions

module Openfooty
  
  # create config/initializers/openfooty.rb
  # 
  # Openfooty.configure do |config|
  #   config.api_key = 'api_key'
  # end
  # client = Openfooty::Client.new
  #
  # or
  #
  # Openfooty.api_key = 'api_key'
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
  end
  
end

require File.join(directory, 'openfooty', 'client')