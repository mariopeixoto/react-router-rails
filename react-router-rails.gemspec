# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'react/router/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "react-router-rails"
  spec.version       = React::Router::Rails::VERSION
  spec.authors       = ["Mario Peixoto"]
  spec.email         = ["mario.peixoto@gmail.com"]
  spec.summary       = %q{A gem for distribution of the react-router using the asset pipeline}
  spec.description   = %q{React-Router for Rails Asset Pipeline}
  spec.homepage      = "https://github.com/mariopeixoto/react-router-rails"
  spec.license       = "MIT"

  spec.files = Dir['{lib,vendor}/**/*', 'LICENSE', 'README.md']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency 'rails', '>= 3.1'
  spec.add_dependency 'react-rails', '~> 1.4'
end
