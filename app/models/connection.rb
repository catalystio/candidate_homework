class Connection < ApplicationRecord
  belongs_to :integration

  validates_presence_of :path, :username, :password
end
