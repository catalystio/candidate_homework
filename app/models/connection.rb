# frozen_string_literal: true
class Connection < ApplicationRecord
  # associations
  belongs_to :integration

  # store
  store :auth, accessors: %i[username password], coder: JSON
  store :path, accessors: %i[host database table], coder: JSON
end
