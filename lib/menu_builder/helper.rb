module MenuBuilder
  module ViewHelpers
    def menu(options={}, &block)
      content_tag :ul, Menu.new(self, &block).render, options
    end

    private

      class MenuItem
        attr_reader :item, :args, :block

        def initialize(item, args, block)
          @item, @args, @block = item, args, block
        end

        def link_to_in_context context
          context.link_to *@args, &@block
        end

        def to_sym
          item.to_sym
        end
      end

      class Menu
        def initialize(context, &block)
          @context      = context
          @menu_items   = context.instance_variable_get('@menu_items')
          @actual_items = []
          @block        = block
        end

        def method_missing item, *args, &block
          @actual_items << MenuItem.new(item, args, block)
          nil
        end

        def render
          @block.call(self)
          @actual_items.map { |item| render_one item }.join.html_safe
        end

        def render_one item
          @context.content_tag :li, item.link_to_in_context(@context), html_options_for(item)
        end

        def html_options_for item
          css_classes = []
          css_classes << "current" if included_in_current_items? item
          css_classes << "first"   if first? item
          css_classes << "last"    if last? item

          options = {}
          options[:class] = css_classes.join(" ") if css_classes.any?
          options
        end

        def included_in_current_items?(item)
          @menu_items.present? && @menu_items.include?(item.to_sym)
        end

        def last? item
          @actual_items.last == item
        end

        def first? item
          @actual_items.first == item
        end
      end
  end
end
