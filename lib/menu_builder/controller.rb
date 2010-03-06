module MenuBuilder
  module Controller

    def menu_item(name, options = {})
      before_filter(options) do |controller|
        controller.instance_variable_set('@menu_item', name)
      end
    end

  end
end
