# Candidate Homework

Thank you for your interest in working with Catalyst! This repo is a boilerplate Rails 5.2 application that is in need of some work. Below are two prompts for changes that are needed. We want to see how you approach these challenges. Completing this work should not take more than two or three hours.

## How to submit

To get started, please fork this repo, and create a new branch with your name. When finished working, open a pull request from your feature branch containing all of your changes, into the master branch within your fork. That way we can see the changes, comment, and ask questions.

## Getting started

* Install Postgres
* Ensure there is a user called `candidate_homework` with an empty password, or update the username and password in `config/database.yml`
* run `rake db:create`
* run `rake db:migrate`
* run `rake db:seed`

## Prompt 1 - Data model changes and migration

You'll find an Integration model that holds connections in its `config` jsonb column, that looks like this:

````ruby
{
  connections: [
    {
      auth: {
        username: 'postgres',
        password: 'postgres'
      },
      path: {
        host: 'localhost',
        database: 'analytics',
        table: 'users'
      },
      field_mapping: [
        ['user_local_field_1', 'user_external_field_1'],
        ['user_local_field_2', 'user_external_field_2'],
        ['user_local_field_3', 'user_external_field_3']
      ]
    },
    {
      auth: {
        username: 'postgres',
        password: 'postgres'
      },
      path: {
        host: 'localhost',
        database: 'analytics',
        table: 'orders'
      },
      field_mapping: [
        ['order_local_field_1', 'order_external_field_1'],
        ['order_local_field_2', 'order_external_field_2'],
        ['order_local_field_3', 'order_external_field_3']
      ]
    }
  ]
}
````

We'll say this model grew organically and required multiple connections to be stored in a single integration record. Now we need to split it up. We need to get individual records for elements in the `field_mappings` portion of a connection, while maintaining its connection to the `path` information.

1. Add additional models where needed.
2. Write database migrations to add the new table or tables.
3. Write a script that can take the data added to the db through the database seed and put it into the new data model you design.

### Instructions to run script

1. Go to project directory in terminal. 
2. Run `rake migrate:field_mapping_data` before run this task ensure you have run all new added migrations.
3. We can also add this script instructions in a new migration and then drop column from `integrations` table.


To evaluate, we will run the same steps as the "Getting started" section above, and then apply your changes. After your changes are applied we will run the new database migration(s) and your script for data migration. Please include instructions for how to run your scripts.

## Prompt 2 - Maintain the API Contact

There is an Grape API file at `app/api/api/integrations.rb` that establishes the show view for a given Integration. The response looks like this:

````json
{
    "id": 1,
    "name": "Integration 1",
    "connections": [
        {
            "path": "localhost.analytics.users",
            "field_mappings": [
                {
                    "local_field": "user_local_field_1",
                    "external_field": "user_external_field_1"
                },
                {
                    "local_field": "user_local_field_2",
                    "external_field": "user_external_field_2"
                },
                {
                    "local_field": "user_local_field_3",
                    "external_field": "user_external_field_3"
                }
            ]
        },
        {
            "path": "localhost.analytics.orders",
            "field_mappings": [
                {
                    "local_field": "order_local_field_1",
                    "external_field": "order_external_field_1"
                },
                {
                    "local_field": "order_local_field_2",
                    "external_field": "order_external_field_2"
                },
                {
                    "local_field": "order_local_field_3",
                    "external_field": "order_external_field_3"
                }
            ]
        }
    ]
}
````

After making your changes to the data model, ensure that this API endpoint returns the same set of data. Assume that there is a separately deployed front end application that relies on this endpoint.

Additionally, you'll find a API spec at `spec/app/api/api/integrations_spec.rb` that tests the output of this API endpoint. Note that this API tests against the development database. While a real application should load fixtures or factory objects into the database, to simplify the setup process for this homework we will test against the development database.

### Evaluation

After running your database migration and data migration script, this API spec should still pass.

