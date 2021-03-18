class Connection < ApplicationRecord
  belongs_to :integration
  has_many :field_mappings

  def path
    @path ||= OpenStruct.new(super).freeze
  end
end
