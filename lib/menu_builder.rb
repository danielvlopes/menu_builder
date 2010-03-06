require 'menu_builder/controller'
require 'menu_builder/view'

ActionController::Base.extend(MenuBuilder::Controller)
ActionView::Base.send(:include, MenuBuilder::ViewHelpers)