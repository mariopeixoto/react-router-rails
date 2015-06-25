module React
  module Router
    module Rails
      module ViewHelper
        def react_router(routes, location = 'HashLocation', args = {}, options = {}, &block)
          options = {:tag => options} if options.is_a?(Symbol)
          if options[:prerender_location]
            fail "Server rendering doesn't work with HashLocation" if location == 'HashLocation'
            block = Proc.new do
              concat React::Router::Renderer.render(routes, options[:prerender_location], args)
            end
          end

          html_options = options.reverse_merge(:data => {})
          html_options[:data].tap do |data|
            data[:'react-router-class'] = routes
            data[:'react-router-location'] = location
            data[:'react-router-data'] = args.to_json
          end
          html_tag = html_options[:tag] || :div

          html_options.except!(:tag, :prerender_location)

          content_tag(html_tag, '', html_options, &block)
        end
      end
    end
  end
end
