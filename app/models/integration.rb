# == Schema Information
#
# Table name: integrations
#
#  id                                                                    :bigint           not null, primary key
#  config(Arbitrary JSON that the FE will parse to generate layout data) :jsonb
#  name                                                                  :string
#  created_at                                                            :datetime         not null
#  updated_at                                                            :datetime         not null
#
class Integration < ApplicationRecord
  has_many :connections
  has_many :field_mappings

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
