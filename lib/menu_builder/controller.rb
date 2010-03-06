module MenuBuilder
  module Controller

    def current_tab(name, options = {})
      before_filter(options) do |controller|
        controller.instance_variable_set('@current_tab', name)
      end
    end

  end
end