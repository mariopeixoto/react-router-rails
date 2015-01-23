module React
  module Router
    module Rails
      module ViewHelper
        def react_router(routes, location = 'HashLocation', &block)
          html_options = {
            :'data-react-router-class' => routes,
            :'data-react-router-location' => location
          }
          
          content_tag(:div, '', html_options, &block)
        end

      end
    end
  end
end
