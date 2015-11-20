require 'connection_pool'

module React
  module Router
    class Renderer
      class PrerenderError < RuntimeError
        def initialize(route_name, location, props, js_message)
          message = "Encountered error \"#{js_message}\" when prerendering #{route_name} with #{location} and #{props}"
          super(message)
        end
      end

      cattr_accessor :pool

      def self.setup!(react_js, react_server_js, react_router_js, routes_js, args={})
        @@react_js = react_js
        @@react_server_js = react_server_js
        @@react_router_js = react_router_js
        @@routes_js = routes_js
        @@pool.shutdown {} if @@pool
        reset_combined_js!
        default_pool_options = {:size => 10, :timeout => 20}
        @@pool = ConnectionPool.new(default_pool_options.merge(args)) { self.new }
      end

      def self.render(routes, location, args={})
        @@pool.with do |renderer|
          renderer.render(routes, location, args)
        end
      end

      def self.react_props(args={})
        if args.is_a? String
          args
        else
          args.to_json
        end
      end

      def context
        @context ||= ExecJS.compile(self.class.combined_js)
      end

      def render(routes, location, args={})
        react_props = React::Router::Renderer.react_props(args)
        jscode = <<-JS
          function() {
            var str = '';
            ReactRouter.run(#{routes}, #{location.to_json}, function (Handler) {
              str = ReactDOMServer.renderToString(React.createElement(Handler, #{react_props}));
            });
            return str;
          }()
        JS
        context.eval(jscode).html_safe
      rescue ExecJS::ProgramError => e
        raise PrerenderError.new(routes, location, react_props, e)
      end

      private

      def self.setup_combined_js
        <<-CODE
          var global = global || this;
          var self = self || this;
          var window = window || this;

          var console = global.console || {};
          ['error', 'log', 'info', 'warn'].forEach(function (fn) {
            if (!(fn in console)) {
              console[fn] = function () {};
            }
          });
          function setTimeout(callback, args) {
            return callback.call();
          }

          #{@@react_js.call};
          React = global.React;
          #{@@react_server_js.call};
          ReactDOMServer = global.ReactDOMServer;
          #{@@react_router_js.call}
          ReactRouter = global.ReactRouter;
          #{@@routes_js.call};
        CODE
      end

      def self.reset_combined_js!
        @@combined_js = setup_combined_js
      end

      def self.combined_js
        @@combined_js
      end
    end
  end
end
