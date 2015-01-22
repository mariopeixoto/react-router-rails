# react-router-rails

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
  ```

3. Using React Router in your javascript:

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

[React Router](https://github.com/rackt/react-router/) by Ryan Florence, Michael Jackson licensed under the [MIT license](https://github.com/rackt/react-router/blob/master/LICENSE)

Copyright [Mario Peixoto](https://github.com/mariopeixoto), released under the [MIT license](https://github.com/mariopeixoto/react-router-rails/LICENSE).