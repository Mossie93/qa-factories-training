# Tasks for QA:

- There are some failing specs in the `features` directory.
Your task is to fix them by writing factories and using them in your test.
- For each task I've prepared some tips, listed below.
- Please remember, that all capitilized values should be replaced by qa with his own code.
- After finishing those 3 easy tests, please move to your projects and code some awesome stuff :)

## Task 1
- Go to `spec/features/countries_page_spec.rb`
- You need to create factories for 4 models: `User`, `Country`, `Bird` and `Region`.
- You might need to browse `app/db/schema.rb` - it contains the list of all fields for each model.
- You might also need to browse `app/models/user.rb` and `app/models/country.rb` to find out which fields are validated.
- Ask your couch or do some research about `traits` usage in FactoryGirl.

## Task 2
- Go to `spec/features/birds_page_spec.rb`.
- Now you will need to write factory for the next model, called `Bird`.

## Task 3
- Go to `spec/factories/bird_page_spec.rb`
- Write factories for 1 new model: `EnvironmentalLaw` and fix the tests.
