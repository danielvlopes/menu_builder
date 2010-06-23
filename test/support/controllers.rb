class ApplicationController < ActionController::Base
  protected
  def default_render
    render :text => action_name
  end
end
