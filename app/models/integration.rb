class Integration < ApplicationRecord
  has_many :connections, dependent: :destroy


  # def connections
  #   config['connections'].map do |connection|
  #     auth = OpenStruct.new(connection['auth'])
  #     path = OpenStruct.new(connection['path'])
  #     field_mappings = connection['field_mapping'].map do |mapping|
  #       OpenStruct.new(local_field: mapping[0], external_field: mapping[1])
  #     end

  #     OpenStruct.new(auth: auth, path: path, field_mappings: field_mappings)
  #   end
  # end
end
