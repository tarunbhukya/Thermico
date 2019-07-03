# README

This README would normally document whatever steps are necessary to get the
application up and running.

- make sure redis server is on
- bundle exec sidekiq

- rails db:create
- rails db:migrate
- rails db:seed
- rails s

urls:
 - get /thermostats
 - post /thermostats
 - get /thermostats/:household_token
 - post /thermostats/:household_token/readings     
 - get /thermostats/:household_token/readings/:tracking_number
 - get /thermostats/:household_token/stats
