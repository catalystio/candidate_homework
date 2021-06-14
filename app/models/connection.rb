class Connection < ApplicationRecord
  belongs_to :integration
  has_many :field_mappings

  def config
    config_hash = super.with_indifferent_access
    auth = OpenStruct.new(config_hash[:auth])
    path = OpenStruct.new(config_hash[:path])
    OpenStruct.new(auth: auth, path: path)
  end
end
