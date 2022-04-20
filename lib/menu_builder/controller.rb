module MenuBuilder
  module Controller
    extend ActiveSupport::Concern

    def menu_items(*items)
      @menu_items = items
    end
    alias_method :menu_item, :menu_items

    def append_menu_items(*items)
      @menu_items += items
    end
    alias_method :append_menu_item, :append_menu_items

    def prepend_menu_items(*items)
      @menu_items = items + @menu_items
    end
    alias_method :prepend_menu_item, :prepend_menu_items

    module ClassMethods
      def menu_items(*items)
        options = items.extract_options!

        before_action(options) do |controller|
          controller.instance_variable_set("@menu_items", items)
        end
      end
      alias_method :menu_item, :menu_items
    end
  end
end
