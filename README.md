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

2. Require the modified React-Router javascript file in `app/assets/javascripts/application.js`:

  ```js
  //= require react_router
  ```
  
  Or in `app/assets/javascripts/application.js.coffee`:
  
  ```coffeescript
  #= require react_router
  ```

## Acknowledgements

[React Router](https://github.com/rackt/react-router/) licensed under the [MIT license](https://github.com/rackt/react-router/blob/master/LICENSE)

Copyright [Mario Peixoto](https://github.com/mariopeixoto), released under the [MIT license](https://github.com/mariopeixoto/react-router-rails/LICENSE).