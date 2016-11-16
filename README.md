Qa Factories Training
================

Application written for internal FactoryGirl workshops in Netguru.
-----------

This application requires:

- Ruby 2.3.1
- Rails 4.2.6
- Postgres

Installation
---------------
- Clone this repo
- Enter project directory
- Fill in database.yml with valid username and password
- Run `bundle install`
- Run `rake db:setup`
- Run `rake db:migrate RAILS_ENV=test`

Testing
---------------
- Enter project directory and run command `rspec spec`

More reading
---------------
- FactoryGirl tutorial and exercises can be found [here](https://github.com/Mossie93/qa-factories-training/blob/master/spec/README.md).

TODO
---------------
- Hide profile buttons
- Fix issue with avatar link
- Check if adding user photos works
- Prepare some tests
- Add task for FactoryGirl traits
- Add tasks to fill in the tests

From developers for QAs <3
