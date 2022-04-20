MenuBuilder::Routes = ActionDispatch::Routing::RouteSet.new
MenuBuilder::Routes.draw do
  get "books" => "books#index"

  get "author/profile" => "authors#profile"
  get "author/related" => "authors#related"

  get "settings" => "settings#index"
  get "settings/notifications" => "settings#notifications"
end

class ApplicationController < ActionController::Base; end
ActionController::Base.send :include, MenuBuilder::Routes.url_helpers

class ActiveSupport::TestCase
  setup do
    @routes = MenuBuilder::Routes
  end
end

class BooksController < ApplicationController
  menu_item :books
  def index
    head :ok
  end
end

class SettingsController < ApplicationController
  menu_items :settings, :home

  def index
    head :ok
  end

  def notifications
    menu_item :notification
    head :ok
  end
end

class AuthorsController < ApplicationController
  before_action :set_base_items

  def profile
    append_menu_item :profile
    head :ok
  end

  def related
    prepend_menu_item :related
    head :ok
  end

  private

  def set_base_items
    menu_item :authors, :author_1
  end
end
