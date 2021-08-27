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
end
