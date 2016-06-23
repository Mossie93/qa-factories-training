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
- Write factories for 2 new models: `UserPhoto` and `EnvironmentalLaw` and fix the tests.

## Some user stories - some of them might not work, app is still under heavy development
1. When user is not signed in
- And he tries to show countries list
- App redirects him to sign in page

2. When user is not signed in
- And he tries to show birds list
- App redirects him to sign in page

3. When user is signed in
- And he tries to show countries list
- He can see countries list.
- For each country he can see number of regions and occuring birds
- After selecting country he gets redirected to country page
- In country page he can see list of regions, birds and environmental laws for given country

4. When user is signed in
- And he tries to show birds list
- He is being shown a birds list
- After selecting bird from a list, he gets redirected to bird page
- In the bird page he can see bird name, latin_name, description, list of regions where he occured and list
of environmental laws protecting him.
