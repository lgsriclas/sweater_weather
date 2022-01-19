# Sweater Weather

## Background and Description

Sweater weather is a Rails application that allows users to see current and future weather forecasts and plan road trips.  It was developed as a project at Turing School of Software and Design.  

## APIs

This application utilizes an internal "users" API as well as three external APIs. Please note that the external API keys need to be requested and added to the application.yml. You can access data through the following API calls:


- **Weather Forecast**
    [OpenWeather OneCall](https://openweathermap.org/api)

    GET '/api/v1/forecast'
    (http://localhost:3000/api/v1/forecast?location=hoboken,nj)

- **Roadtrip**
    [Mapquest Developer](https://developer.mapquest.com/)

    POST '/api/v1/road_trip'
    Params :location and :api_key must be passed in body of request as JSON.
    (http://localhost:3000/api/v1/road_trip)

- **Background Image**
    [Pexels](https://www.pexels.com/api)

    GET '/api/v1/backgrounds'
    (http://localhost:3000/api/v1/backgrounds?location=hoboken,nj)

- **Create User**
    POST '/api/v1/users'

    Params :email, :password, and :password_confirmation must be passed in body of request as JSON.

- **Log in Existing User**
    POST '/api/v1/sessions'
    
    Params :email and :password must be passed in body of request as JSON.

## Setup and Testing

This project utilizes Rails 5.2.6 and Ruby 2.7.2

* Fork this repository
* Clone your fork
* From the command line, install gems and set up the users database:
    * `bundle install`
    * `rails db:drop db:create db:migrate`
* Run the test suite with `bundle exec rspec`.
  * The RSpec test suite can be found in the project's spec directory.
* Run your development server with `rails s` to see the app in action.

## Contributers

- [Lesley Sanders](https://github.com/lgsriclas)
