class Connection < ApplicationRecord
  belongs_to :integration
  has_many :field_mappings

  validates_presence_of :path, :username, :password
end
