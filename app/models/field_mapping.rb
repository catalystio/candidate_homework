class FieldMapping < ApplicationRecord
  belongs_to :connection

  def local_field
    config[0]
  end

  def external_field
    config[1]
  end
end
