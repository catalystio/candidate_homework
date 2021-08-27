# == Schema Information
#
# Table name: connections
#
#  id         :bigint           not null, primary key
#  auth       :json
#  path       :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Connection < ApplicationRecord
end
