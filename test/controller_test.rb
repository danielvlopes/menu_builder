require "test_helper"

class ActiveSupport::TestCase
  setup do
    @routes = MenuBuilder::Routes
  end
end

class BooksController < ApplicationController
  menu_item :books
  def index ; end
end

class SettingsController < ApplicationController
  menu_items :settings, :home

  def index ; end

  def notifications
    menu_item :notification
  end
end

class BooksControllerTest < ActionController::TestCase
  test "assigns the current tab" do
    get :index
    assert_equal([:books], assigns(:menu_items))
  end
end

class SettingsControllerTest < ActionController::TestCase
  test "ability to assign more than one current tab" do
    get :index
    assert_equal([:settings, :home], assigns(:menu_items))
  end

  test "that instance level menu_items override class level" do
    get :notifications
    assert_equal([:notification], assigns(:menu_items))
  end
end