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

          separate_props = options.delete :separate_props
          move_separate_props_out = options.delete :move_separate_props_out

          html_options = options.reverse_merge(:data => {})
          html_options[:data].tap do |data|
            data[:'react-router-class'] = routes
            data[:'react-router-location'] = location
            next if args.empty?
            if separate_props
              data[:react_props_id] = add_react_props args, move_separate_props_out
            else
              data[:react_props] = React::Renderer.react_props args
            end
          end
          html_tag = html_options[:tag] || :div

          html_options.except!(:tag, :prerender_location)

          result = content_tag(html_tag, '', html_options, &block)
          result += render_react_props html_options[:data][:react_props_id] if separate_props && !move_separate_props_out
          result
        end

        # Add properties for component and return element id.
        #
        def add_react_props(props={}, move_out=false)
          return if props.empty?
          props_id = SecureRandom.base64
          content_key = "react_props"
          content_key += "_#{props_id}" unless move_out
          content_for content_key do
            content_tag :script, type: 'text/json', id: props_id do
              raw React::Router::Renderer.react_props props
            end
          end
          props_id
        end

        # Render script tag with JSON props. Should be placed at the end of body
        # in order to speedup page rendering.
        #
        def render_react_props(element_id=nil)
          element_id.nil? && content_for('react_props') || content_for("react_props_#{element_id}")
        end

      end
    end
  end
end

