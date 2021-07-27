class Connection < ApplicationRecord
  # Relations
  belongs_to :integration
  has_many :field_mappings
end
