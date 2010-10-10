require "test_helper"

class HelperTest < ActionView::TestCase
  tests MenuBuilder::ViewHelpers

  attr_accessor :controller, :request

  test "menu yields an instance of Menu" do
    concat(menu do |m|
      assert m.instance_of?(MenuBuilder::ViewHelpers::Menu)
    end)
  end

  test "menu create an unordered list" do
    concat(menu(:id => "menu") { |m| })
    assert_select "ul#menu"
  end

  test "menu accept html options like classes and id" do
    concat(menu :id=>"menu", :class=>"tabs" do |m| end)
    assert_select "ul#menu.tabs"
  end

  test "menu create a line item" do
    concat(menu { |m| concat m.home "Home", "#" })
    assert_select "li", 1
  end

  test "create a link inside line item" do
    concat(menu { |m| concat m.home "Home", "/" })
    expected = %(<ul><li><a href="/">Home</a></li></ul>)
    assert_dom_equal expected, output_buffer
  end

  test "set the class to the current item li" do
    @menu_items = [:home]
    concat(menu do |m|
      concat m.home "Home", "/"
      concat m.contact "Store", "/store"
    end)

    assert_select "li.current", 1
  end

  test "accept more than one menu item" do
    @menu_items = [:settings, :notifications]

    concat(menu do |m|
      concat m.home "Home", "/"
      concat m.notifications "Notifications", "/notifications"
      concat m.settings "Settings", "/settings"
    end)

    assert_select "li.current", 2
  end

  test "accept more than one menu" do
    @menu_items = [:settings, :notifications]

    concat(menu do |m|
      concat m.home "Home", "/"
      concat m.notifications "Notifications", "/notifications"
    end)

    concat(menu do |m|
      concat m.home "Contact", "/contact"
      concat m.notifications "Settings", "/settings"
    end)

    assert_select "li.current", 2
  end
end