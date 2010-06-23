require "test_helper"

class ActiveSupport::TestCase
  setup do
    @routes = MenuBuilder::Routes
  end
end

class BooksController < ApplicationController
  menu_item :home

  def index
  end
end

class MenuBuilderTest < ActionController::TestCase
  tests BooksController

  test "should assigns the current tab" do
    get :index
    assert_equal(:home, assigns(:menu_item))
  end

end