Important: This gem is not maintained anymore, and it's only compatible up to Rails 4.

# react-router-rails

[![Gem Version](https://badge.fury.io/rb/react-router-rails.svg)](https://badge.fury.io/rb/react-router-rails.svg)

[React Router](https://github.com/rackt/react-router/) for Rails asset pipeline

- React Router version: [0.13.3](https://github.com/rackt/react-router/tree/v0.13.3)

## Installation

1. Add to your `Gemfile` and install with bundler:

  ```ruby
  gem 'react-router-rails', '~>0.13.3.2'
  ```

  ```bash
  bundle install
  ```

2. Require the modified React-Router javascript file in `app/assets/javascripts/application.js`:

  ```js
  //= require react_router
  // OR
  //= require react_router.min

  //Optional. Gives you the ability to use the view helper in your template
  //= require react_router_ujs
  ```

  Or in `app/assets/javascripts/application.js.coffee`:

  ```coffeescript
  #= require react_router
  #OR
  #= require react_router.min

  #Optional. Gives you the ability to use the view helper in your template
  #= require react_router_ujs
  ```
3. Using the view helper:

  Define your routes 'MyRoutes' in your react components folder, like you would normally do:

  ```js
  var Route = ReactRouter.Route;

  this.MyRoutes = (
    <Route handler={App}>
      <Route name='home' handler={Home} path='/' />
      ...
    </Route>
  );
  ```

  In the view helper set the name of your routes component

  ```erb
  <%= react_router 'MyRoutes' %>
  ```

  Optionally set the location handler (defaults to HashLocation):

  ```erb
  <%= react_router 'MyRoutes', 'HistoryLocation' %>
  ```

  If you use server rendering:

  ```erb
  <%= react_router 'MyRoutes', 'HistoryLocation', {}, { prerender_location: path_to_route } %>
  ```
4. Require your components folder AFTER your react_router:

   ```coffeescript
    #= require react_router
    #= require components
  ```
  
5. Using React Router in your javascript :

  ```js
  ReactRouter.run(routes, function (Handler) {
    ReactDOM.render(<Handler/>, document.body);
  });
  ```

  Or in coffeescript:

  ```coffeescript
  ReactRouter.run(routes, (Handler) ->
    ReactDOM.render <Handler/>, document.body
  )
  ```

## Roadmap

1. Better handle of production version

  Instead of explicit require minified version, we should make it possible to configure that in the environment config files like the react-rails configuration (ex. config.react_router_variant = :production)

## Acknowledgements

This gem is highly inspired and based on [React Rails](https://github.com/reactjs/react-rails) code. Thanks!

A big thanks to [@troter](https://github.com/troter) who implemented the server-side rendering engine for this gem.

[React Router](https://github.com/rackt/react-router/) by [Ryan Florence](https://github.com/ryanflorence), [Michael Jackson](https://github.com/mjackson) licensed under the [MIT license](https://github.com/rackt/react-router/blob/master/LICENSE)

Copyright [Mario Peixoto](https://github.com/mariopeixoto), released under the [MIT license](https://github.com/mariopeixoto/react-router-rails/LICENSE).
