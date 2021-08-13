class Connection < ApplicationRecord
  #associations
  belongs_to :integration
  has_many :field_mappings, dependent: :destroy

  def path
    OpenStruct.new(host: host, database: database, table: table)
  end  
end
