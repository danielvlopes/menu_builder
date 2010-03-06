module MenuBuilder
  module ViewHelpers
    class Tab

      def initialize(context)
        @context = context
        @current_tab = @context.instance_variable_get('@current_tab')
      end

      def current_tab?(tab)
        @current_tab.to_s == tab.to_s
      end

      def method_missing(tab, *args, &block)
        css_class = "current" if current_tab?(tab)
        @context.content_tag :li, @context.link_to(*args, &block), :class=>css_class
      end

    end

    def tabs(options={})
      concat tag(:ul, options, true)
      yield Tab.new(self)
      concat "</ul>"
    end
    
  end
end

ActionView::Base.send(:include, MenuBuilder::ViewHelpers)