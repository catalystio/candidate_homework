require 'rails_helper'

RSpec.describe FieldMapping, type: :model do
  describe 'associations' do
    it { should belong_to(:connection) }
  end

  describe 'validations' do
    it { should validate_presence_of(:local_field) }
    it { should validate_presence_of(:external_field) }
  end
end
