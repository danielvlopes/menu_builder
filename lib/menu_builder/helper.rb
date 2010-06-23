module MenuBuilder
  module ViewHelpers
    class Menu

      def initialize(context)
        @context = context
        @menu_item = @context.instance_variable_get('@menu_item')
      end

      def current_item?(item)
        @menu_item.to_s == item.to_s
      end

      def method_missing(item, *args, &block)
        css_class = "current" if current_item?(item)
        @context.content_tag :li, @context.link_to(*args, &block), :class=>css_class
      end

    end

    def menu(options={}, &block)
      content_tag :ul, capture(Menu.new(self), &block), options
    end

  end
end