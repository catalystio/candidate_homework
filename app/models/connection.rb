# == Schema Information
#
# Table name: connections
#
#  id             :bigint           not null, primary key
#  auth           :json
#  path           :json
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  integration_id :bigint
#
# Indexes
#
#  index_connections_on_integration_id  (integration_id)
#
# Foreign Keys
#
#  fk_rails_...  (integration_id => integrations.id)
#
class Connection < ApplicationRecord
  belongs_to :integration
  has_many :field_mappings

  store :auth, accessors: %i[username password]
  store :path, accessors: %i[host database table]

  def joined_path
    path.values.join('.')
  end
end
