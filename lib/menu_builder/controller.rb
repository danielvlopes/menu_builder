module MenuBuilder
  module Controller
    extend ActiveSupport::Concern

    def menu_item(name, options = {})
      instance_variable_set('@menu_item', name)
    end

    module ClassMethods
      def menu_item(name, options = {})
        before_filter(options) do |controller|
          controller.instance_variable_set('@menu_item', name)
        end
      end
    end

  end
end
