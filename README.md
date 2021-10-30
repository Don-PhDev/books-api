# Books

## Gems added

* gem 'devise'
* gem 'bcrypt'
* gem 'jsonapi-serializer'
* gem 'rack-cors'
* gem 'pry-byebug'
* gem 'faker'
* gem 'factory_bot_rails'
* gem 'rspec-rails', '~> 5.0', '>= 5.0.2' 
* gem 'shoulda-matchers', '~> 5.0'

## Configuration

* `config/database.yml`

      adapter: postgresql
      encoding: unicode
      pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
      username: postgres

## Getting started

* in the root of the repository
            
      bundle install
      rails db:create
      rails db:seed
      rspec
