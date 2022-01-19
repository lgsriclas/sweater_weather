# Sweater Weather

## Background and Description

Sweater weather is a Rails application that allows users to see current and future weather forecasts and plan road trips.  It was developed as a project at Turing School of Software and Design.  

## APIs

This application utilizes one internal API as well as the following external APIS:

- [OpenWeather OneCall](https://openweathermap.org/api)
- [Mapquest Developer](https://developer.mapquest.com/)
- [Pexels](https://www.pexels.com/api)

## Learning Goals
- [title](https://openweathermap.org/api)
- Use serializers to format JSON responses
- Test API exposure
- Use SQL and ActiveRecord to gather data

## Setup and Testing

This project utilizes Rails 5.2.6 and Ruby 2.7.2

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle install`
    * `rails db:drop db:create db:migrate, db:seed`
    * `rails csv_load:all`
    * `rails db:schema:dump`
* Run the test suite with `bundle exec rspec`.
  * The RSpec test suite can be found in the project's spec directory.
* Run your development server with `rails s` to see the app in action.

## Contributers

- [Lesley Sanders](https://github.com/lgsriclas)
