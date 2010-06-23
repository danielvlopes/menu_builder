require "test_helper"

class HelperTest < ActionView::TestCase
  tests MenuBuilder::ViewHelpers

  test "menu yields an instance of Menu" do
    concat(menu do |m|
      assert m.instance_of?(MenuBuilder::ViewHelpers::Menu)
    end)
  end

  test "menu create an unordered list" do
    concat(menu(:id => "menu") { |m| })
    assert_select "ul#menu"
  end
 
  test "menu should accept html options like classes and id" do
    concat(menu :id=>"menu", :class=>"tabs" do |m| end)
    assert_select "ul#menu.tabs"
  end
  
  test "menu should create a line item" do
    concat(menu { |m| concat m.home "Home", "#" })
    assert_select "li", 1
  end
  
  test "should create a link inside line item" do
    concat(menu { |m| concat m.home "Home", "/" })
    expected = %(<ul><li><a href="/">Home</a></li></ul>)
    assert_dom_equal expected, output_buffer
  end
  
  test "should set the class to the current item li" do
    @menu_item = :home
    concat(menu do |m|
      concat m.home "Home", "/"
      concat m.contact "Store", "/store"
    end)
  
    assert_select "li.current", 1
  end

end