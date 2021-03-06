class Connection < ApplicationRecord
  belongs_to :integration
  belongs_to :auth

  validates_presence_of :host, :database, :table
end
