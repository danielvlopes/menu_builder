require "test_helper"
require_relative "./support/controllers"

class BooksControllerTest < ActionController::TestCase
  test "assigns the current tab" do
    get :index
    assert_equal([:books], assigns(:menu_items))
  end
end

class SettingsControllerTest < ActionController::TestCase
  test "can assign more than one current tab" do
    get :index
    assert_equal(%i[settings home], assigns(:menu_items))
  end

  test "can set action level menu_items" do
    get :notifications
    assert_equal([:notification], assigns(:menu_items))
  end
end

class AuthorsControllerTest < ActionController::TestCase
  test "ability to append items" do
    get :profile
    assert_equal(%i[authors author_1 profile], assigns(:menu_items))
  end

  test "that instance level menu_items override class level" do
    get :related
    assert_equal(%i[related authors author_1], assigns(:menu_items))
  end
end
