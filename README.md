# react-router-rails

[![Gem Version](https://badge.fury.io/rb/react-router-rails.svg)](https://badge.fury.io/rb/react-router-rails.svg)

[React Router](https://github.com/rackt/react-router/) for Rails asset pipeline

- React Router version: [0.11.6](https://github.com/rackt/react-router/tree/v0.11.6)

## Installation

1. Add to your `Gemfile` and install with bundler:

  ```ruby
  gem 'react-router-rails', '~>0.11.6'
  ```
  
  ```bash
  bundle install
  ```

2. Require the modified React-Router javascript file in `app/assets/javascripts/application.js`:

  ```js
  //= require react_router
  // OR
  //= require react_router.min
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

  Define your routes 'MyRoutes' in any javascript file like you would normally do:

  ```coffeescript
  Route = ReactRouter.Route

  @AppRoutes = (
    <Route handler={App}>
      <Route name='home' handler={Home} path='/' />
    </Route>
  )
  ```

  In the view helper set the name of your routes component

  ```erb
  <%= react_router 'MyRoutes' %>
  ```

  Optionally set the location handler (defaults to HashLocation):

  ```erb
  <%= react_router 'MyRoutes', 'HistoryLocation' %>
  ```

4. Using React Router in your javascript :

  ```js
  ReactRouter.run(routes, function (Handler) {
    React.render(<Handler/>, document.body);
  });
  ```

  Or in coffeescript:

  ```coffeescript
  ReactRouter.run(routes, (Handler) ->
    React.render <Handler/>, document.body
  )
  ```

## Acknowledgements

This gem is highly inspired and based on [React Rails](https://github.com/reactjs/react-rails) code. Thanks!

[React Router](https://github.com/rackt/react-router/) by [Ryan Florence](https://github.com/rpflorence), [Michael Jackson](https://github.com/mjackson) licensed under the [MIT license](https://github.com/rackt/react-router/blob/master/LICENSE)

Copyright [Mario Peixoto](https://github.com/mariopeixoto), released under the [MIT license](https://github.com/mariopeixoto/react-router-rails/LICENSE).