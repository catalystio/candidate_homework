# frozen_string_literal: true
class Integration < ApplicationRecord
  # associations
  has_many :connections, dependent: :destroy
end
