require "test_helper"

class HelperTest < ActionView::TestCase
  tests MenuBuilder::ViewHelpers

  attr_accessor :controller, :request

  test "menu yields an instance of Menu" do
    concat(menu { |m|
      assert m.instance_of?(MenuBuilder::ViewHelpers::Menu)
    })
  end

  test "menu create an unordered list" do
    concat(menu(:id => "menu") { |m| })
    assert_select "ul#menu"
  end

  test "menu accept html options like classes and id" do
    concat(menu(:id=>"menu", :class=>"tabs") { |m| })
    assert_select "ul#menu.tabs"
  end

  test "menu create a line item" do
    concat(menu { |m| concat m.home "Home", "#" })
    assert_select "li", 1
  end

  test "create a link inside line item" do
    concat(menu { |m| concat m.home "Home", "/" })
    assert_select "ul > li > a"
  end

  test "set the class to the current item li" do
    @menu_items = [:home]
    concat(menu { |m|
      concat m.home "Home", "/"
      concat m.contact "Store", "/store"
    })

    assert_select "li.current", 1
  end

  test "customize the current item class" do
    @menu_items = [:home]
    concat(menu({:current_class => "active"}) { |m|
      concat m.home "Home", "/"
      concat m.contact "Store", "/store"
    })

    assert_select "li.current", 0
    assert_select "li.active", 1
  end

  test "accept more than one menu item" do
    @menu_items = [:settings, :notifications]

    concat(menu { |m|
      concat m.home "Home", "/"
      concat m.notifications "Notifications", "/notifications"
      concat m.settings "Settings", "/settings"
    })

    assert_select "li.current", 2
  end

  test "accept more than one menu item for a custom current item class" do
    @menu_items = [:settings, :notifications]

    concat(menu({:current_class => "active"}) { |m|
      concat m.home "Home", "/"
      concat m.notifications "Notifications", "/notifications"
      concat m.settings "Settings", "/settings"
    })

    assert_select "li.current", 0
    assert_select "li.active", 2
  end


  test "accept more than one menu" do
    @menu_items = [:settings, :notifications]

    concat(menu { |m|
      concat m.home "Home", "/"
      concat m.notifications "Notifications", "/notifications"
    })

    concat(menu { |m|
      concat m.home "Contact", "/contact"
      concat m.notifications "Settings", "/settings"
    })

    assert_select "li.current", 2
  end

  test "marks the first item with class .first" do
    concat(menu { |m|
      concat m.home    "Home", "/"
      concat m.contact "Store", "/store"
    })
    assert_select "li.first", 1
  end

  test 'marks the last item with class .last' do
    concat(menu { |m|
      concat m.home    "Home", "/"
      concat m.contact "Store", "/store"
      concat m.notifications "Settings", "/settings"
    })
    assert_select "li.last", 1
  end

  test "pass a block to an item" do
    concat(menu { |m|
      concat(m.account("/account") {
        concat tag(:img, nil, { :src => 'icon.jpg' })
      })
    })

    assert_select "ul > li > a > img"
  end

end
