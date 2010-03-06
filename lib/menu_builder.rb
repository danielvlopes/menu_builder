require 'menu_builder/controller'
require 'menu_builder/helper'

ActionController::Base.extend(MenuBuilder::Controller)
ActionView::Base.send(:include, MenuBuilder::ViewHelpers)