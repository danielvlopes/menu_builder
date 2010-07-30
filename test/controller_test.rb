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
  
  def show
    menu_item :show
  end
end

class MenuBuilderTest < ActionController::TestCase
  tests BooksController

  test "should assigns the current tab in class level" do
    get :index
    assert_equal(:home, assigns(:menu_item))
  end

  test "should assigns the current tab in action level" do
    get :show
    assert_equal(:show, assigns(:menu_item))
  end
end