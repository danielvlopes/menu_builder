require 'menu_builder/controller'
require 'menu_builder/helper'

class ActionController::Base
  include MenuBuilder::Controller
end

class ActionView::Base
  include MenuBuilder::ViewHelpers
end
