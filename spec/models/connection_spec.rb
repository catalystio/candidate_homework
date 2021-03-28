require 'rails_helper'

RSpec.describe Connection, type: :model do
  describe 'associations' do
    it { should belong_to(:integration) }
  end

  describe 'validations' do
    it { should validate_presence_of(:path) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
  end
end
