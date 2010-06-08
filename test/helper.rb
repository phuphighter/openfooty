require 'rubygems'
require 'test/unit'
require 'shoulda'

require 'redgreen'
require 'matchy'
require 'fakeweb'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'openfooty'

# Set the default allow_net_connect option--usually you'll want this off.
# You don't usually want your test suite to make HTTP connections, do you?

class Test::Unit::TestCase
end

FakeWeb.allow_net_connect = false

def fixture_file(filename)
  return '' if filename == ''
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  File.read(file_path)
end

def openfooty_url(url, options={})
  url =~ /^http/ ? url : "http://api.openfooty.org/1.0#{url}"
end

def stub_get(url, filename, options={})
  opts = {:body => fixture_file(filename)}.merge(options)
  
  FakeWeb.register_uri(:get, openfooty_url(url), opts)
end