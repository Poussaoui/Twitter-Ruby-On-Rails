# Twitter Ruby On Rails
 Basic functionalities of Twitter in Ruby On Rails

Features :

This application doesn't provide many features in order to keep it simple. Here are the features that it does include:

    See user profil
    Post new tweet
    Follow/Unfollow user

Setup

$ bundle install
$ bundle exec rails db:migrate Or $ bundle exec rake db:schema:load
$ bundle exec rails server


For CSS Style
    bootstrap

For testing
    faker

See more details on Gemfile.
Test

$ bundle exec rake test test/models/user_test.rb

Data reset and sample data creation

$ bundle exec rake db:seed # Create sample data
