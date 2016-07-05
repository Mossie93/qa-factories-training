# Tasks for QA:

- There are some failing specs in the `features` directory.
Your task is to fix them by writing factories and using them in your test.
- For each task I've prepared some tips.
- Please remember, that all capitilized values should be replaced by qa with his own code.

## Task 1 - writing first factory
In this task you are going to get familiar with basic FactoryGirl usage.
You will need to write a factory for the `Bird` model, which should be placed in `spec/factories/birds.rb` file.
I've already prepared some basic structure in this file, let' take a look at this:
```
FactoryGirl.define do
  factory :bird do

  end
end

```
The very first line tells facorygirl that we will want to create factory for new model, specified further
as `factory :bird`. By default name of your factory should match name of the model
(this bhaviour can be averwrittn, but let's skip it for now :) ). To create our first working facory, we need to know which fields
does our model have. We can find those informations in `db/scema.rb` file.
Every model in this project has corresponding database table, represented in `schema.rb`, f.ex.
for he `Bird` model we will have corresponding `birds` table with specified list of fields:
```
create_table "birds", force: :cascade do |t|
  t.datetime "created_at",  null: false
  t.datetime "updated_at",  null: false
  t.string   "name"
  t.text     "description"
  t.string   "latin_name"
end
```
We can see 5 sield listd in schema for birds table:
- created_at
- updated_at
- name
- description
- latin_name
The first two fields are automatically gnerated by rails and we do not need to specify them in our factory,
yet we should add the last three. You can add the to your factory by writing new line with field name
and default value, like this:
```
FactoryGirl.define do
  factory :bird do
    name "Rudzik"
  end
end
```

Use the example above and add `descripion` and `latin_name` to your factory...

After finishing this factory, go to the console and type in `rails c test`. This command will load rails console in test environment,
allowing you to access FactoryGirl commands.
Now, type the commad below to create new Bird object using your very first factory:
`FactoryGirl.create(:bird)`
Viola! You've just created your first object using FactoryGirl!
But... wait, when you try to run the same command once again, you will see an error:
`Validation failed: Name has already been taken, Latin name has already been taken`
So, what's wrong? Take a look at the `app/models/bird.rb` file, where you should see the following lines:
```
validates :name, presence: true, uniqueness: true
validates :latin_name, presence: true, uniqueness: true
validates :description, presence: true
```
It appears that there is one more place where you should take a look when writing your factory,
which is the model file. Developers pretty often lavy validations in two places:
database (represented by `schema.rb`) and in model files, usually placed in `app/models` directory.

How to avoid such an errors when writing specs? We will learn this in next tasks.
