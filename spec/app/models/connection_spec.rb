require 'rails_helper'

RSpec.describe Connection, type: :model do
  it { should belong_to(:integration) }
  it { should have_many(:field_mappings) }
end
