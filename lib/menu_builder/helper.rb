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

    def menu(options={})
      concat tag(:ul, options, true)
      yield Menu.new(self)
      concat safe_html("</ul>")
    end

  private
    def safe_html(html)
      html.respond_to?(:html_safe) ? html.html_safe : html
    end
    
  end
end