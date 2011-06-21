require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'vcr_setup'
require 'openfooty'

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end