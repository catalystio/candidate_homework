class Path < ApplicationRecord
  belongs_to :connection
  validates_presence_of :host, :database, :table
end
