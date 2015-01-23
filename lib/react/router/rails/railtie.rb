require 'rails'

module React
  module Router
    module Rails
      class Railtie < ::Rails::Railtie

        # Include the react-router-rails view helper lazily
        initializer "react_router_rails.setup_view_helpers" do |app|
          ActiveSupport.on_load(:action_view) do
            include ::React::Router::Rails::ViewHelper
          end
        end
        
      end
    end
  end
end