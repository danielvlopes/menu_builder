require 'rubygems'
require 'test/unit'
require 'action_controller'
require 'action_view/test_case'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

Dir["#{File.dirname(__FILE__)}/support/*.rb"].each { |f| require f }

require 'menu_builder'