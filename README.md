# Rales Engine
## A Ruby on Rails ECommerce API

* Ruby version
`2.4.1` and Rails `5.1.7`
* Installation
`git clone git@github.com:BrennanAyers/rales_engine.git (for SSH)
cd rales_engine
bundle`
* Database creation
Rales Engine uses PostgreSQL, and can be generated with `rails db:create`
* Database initialization
Rails Engine has data included in CSV files (rales_engine/db/csv) for each of our six resources. You may replace these if you wish, just make sure the CSV structure and filename (resources.csv) follow the convention. Each of these files can be loaded with the Rake command below:
`rake import:RESOURCE_NAME_PLURALIZED`
ie; `rake import:merchants`
* How to run the test suite
Rales Engine uses RSpec, and can be run just using `rspec`

* DB Schema
To be added...
