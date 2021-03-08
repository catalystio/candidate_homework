class Connection < ApplicationRecord
  # associations
  belongs_to :integration
  has_many :field_mappings

  # store
  store :auth, accessors: [:username, :password], coder: JSON
  store :path, accessors: [:host, :database, :table], coder: JSON
end
