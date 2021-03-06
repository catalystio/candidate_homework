class Connection < ApplicationRecord
  belongs_to :integration
  belongs_to :auth
  has_many :field_mappings, dependent: :destroy

  validates_presence_of :host, :database, :table
end
