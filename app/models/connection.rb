# frozen_string_literal: true
class Connection < ApplicationRecord
  # associations
  belongs_to :integration
  has_many :field_mappings, dependent: :destroy

  # store
  store :auth, accessors: %i[username password], coder: JSON
  store :path, accessors: %i[host database table], coder: JSON

  validates_presence_of :path, :auth
end
