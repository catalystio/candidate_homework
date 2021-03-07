class Auth < ApplicationRecord
  has_many :connection

  validates_presence_of :username, :password
end
