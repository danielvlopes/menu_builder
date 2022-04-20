require "rubygems"

require "active_support/testing/autorun"
require "abstract_controller"
require "abstract_controller/railties/routes_helpers"
require "action_controller"
require "action_view"
require "action_view/testing/resolvers"
require "action_dispatch"
require "active_support/dependencies"
require "rails-controller-testing"

module Rails
  class << self
    def env
      @_env ||= ActiveSupport::StringInquirer.new(ENV["RAILS_ENV"] || ENV["RACK_ENV"] || "test")
    end

    def root; end
  end
end

Rails::Controller::Testing.install

$LOAD_PATH.unshift File.expand_path("#{File.dirname(__FILE__)}/../lib")
require "menu_builder"

Dir["#{File.dirname(__FILE__)}/support/*.rb"].each { |f| require f }
