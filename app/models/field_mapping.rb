# == Schema Information
#
# Table name: field_mappings
#
#  id             :bigint           not null, primary key
#  external_field :string
#  local_field    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  connection_id  :bigint
#  integration_id :bigint
#
# Indexes
#
#  index_field_mappings_on_connection_id   (connection_id)
#  index_field_mappings_on_integration_id  (integration_id)
#
# Foreign Keys
#
#  fk_rails_...  (connection_id => connections.id)
#  fk_rails_...  (integration_id => integrations.id)
#
class FieldMapping < ApplicationRecord
  belongs_to :connection
  belongs_to :integration
end
