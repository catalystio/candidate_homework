class Integration < ApplicationRecord
  def connections
    config['connections'].map do |connection|
      auth = OpenStruct.new(connection['auth'])
      path = OpenStruct.new(connection['path'])
      field_mappings = connection['field_mapping'].map do |mapping|
        OpenStruct.new(mapping)
      end

      OpenStruct.new(auth: auth, path: path, field_mappings: field_mappings)
    end
  end
end
