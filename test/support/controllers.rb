require 'active_support'
require 'action_controller'

ActionController::Routing::Routes.draw do |map|
  map.connect ':controller/:action/:id'
end

class ApplicationController < ActionController::Base
  protected
  def default_render
    render :text => action_name
  end
end
