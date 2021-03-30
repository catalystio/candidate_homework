FactoryBot.define do
  factory :connection do
    auth do
      {
        username: 'username',
        password: 'password'
      }
    end
    path do
      {
        host: 'localhost',
        database: 'analytics',
        table: 'users'
      }
    end
  end
end
