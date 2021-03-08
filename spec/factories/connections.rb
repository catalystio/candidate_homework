FactoryBot.define do
  factory :connection do
    integration
    auth
    host { 'localhost' }
    database { 'analytics' }
    table { 'users' }
  end
end