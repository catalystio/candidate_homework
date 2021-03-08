FactoryBot.define do
  factory :field_mapping do
    connection
    local_field { 'user_local_field_1' }
    external_field { 'user_external_field_1' }
  end
end
