FactoryBot.define do

  factory :integration do
    name { 'Integration 1' }
    trait :even_field_mappings do
      config do
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
                %w[user_local_field_1 user_external_field_1],
                %w[user_local_field_2 user_external_field_2],
                %w[user_local_field_3 user_external_field_3]
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
                %w[order_local_field_1 order_external_field_1],
                %w[order_local_field_2 order_external_field_2],
                %w[order_local_field_3 order_external_field_3]
              ]
            }
          ]
        }
      end
    end
    trait :odd_field_mappings do
      config do
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
                %w[user_local_field_1 user_external_field_1],
                %w[user_local_field_2 user_external_field_2],
                %w[user_local_field_3]
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
                %w[order_local_field_1 order_external_field_1],
                %w[order_external_field_2],
                %w[order_local_field_3 order_external_field_3]
              ]
            }
          ]
        }
      end
    end
  end
end
