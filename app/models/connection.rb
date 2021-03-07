class Connection < ApplicationRecord
  belongs_to :integration
  belongs_to :auth
  has_many :field_mappings
  has_one :path
end
