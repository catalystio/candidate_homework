class Auth < ApplicationRecord
  validates :username, uniqueness: { scope: :password }
end
