// Unobtrusive scripting adapter for React Router based on react-rails gem.
// https://github.com/reactjs/react-rails/blob/master/lib/assets/javascripts/react_ujs.js
(function(document, window, React, ReactRouter) {
  var ROUTER_CLASS_NAME = 'data-react-router-class';
  var LOCATION_CLASS_NAME = 'data-react-router-location';
  var PROPS_ID_ATTR = 'data-react-props-id';

  // jQuery is optional. Use it to support legacy browsers.
  var $ = (typeof jQuery !== 'undefined') && jQuery;

  var findReactRouterDOMNodes = function() {
    var SELECTOR = '[' + ROUTER_CLASS_NAME + ']';
    if ($) {
      return $(SELECTOR);
    } else {
      return document.querySelectorAll(SELECTOR);
    }
  };

  var mountReactRouter = function() {
    var propsId, propsElement, propsJson;
    var nodes = findReactRouterDOMNodes();
    if (nodes.length >= 1) {
      if (nodes.length > 1) {
        console.warn('React Router is designed to have a single root router. ' + nodes.length + ' routers were found on the html. Using the first one.');
      }
      var routerNode = nodes[0];

      // Assume className is simple and can be found at top-level (window).
      // Fallback to eval to handle cases like 'My.React.ComponentName'.
      var className = routerNode.getAttribute(ROUTER_CLASS_NAME);
      var routes = window[className] || eval.call(window, className);

      var locationName = routerNode.getAttribute(LOCATION_CLASS_NAME);
      var location = ReactRouter[locationName] ;

      var propsId = routerNode.getAttribute(PROPS_ID_ATTR);
      if (propsId != null) {
          propsElement = document.getElementById(propsId);
          propsJson = propsElement && propsElement.text;
      } else {
          propsJson = routerNode.getAttribute(PROPS_ATTR);
      }

      var props = propsJson && JSON.parse(propsJson);

      ReactRouter.run(routes, location, function (Handler) {
        React.render(React.createElement(Handler, props), routerNode);
      });
    }
  };

  var handleTurbolinksEvents = function() {
    var handleEvent;
    if ($) {
      handleEvent = function(eventName, callback) {
        $(document).on(eventName, callback);
      }
    } else {
      handleEvent = function(eventName, callback) {
        document.addEventListener(eventName, callback);
      }
    }
    handleEvent('page:change', mountReactRouter);
  };

  var handleNativeEvents = function() {
    if ($) {
      $(mountReactRouter);
    } else {
      document.addEventListener('DOMContentLoaded', mountReactRouter);
    }
  };

  if (typeof Turbolinks !== 'undefined' && Turbolinks.supported) {
    handleTurbolinksEvents();
  } else {
    handleNativeEvents();
  }

})(document, window, React, ReactRouter);

