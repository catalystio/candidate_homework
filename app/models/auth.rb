class Auth < ApplicationRecord
  has_many :connections

  validates_presence_of :username, :password
  validates :username, uniqueness: { scope: :password }
end
