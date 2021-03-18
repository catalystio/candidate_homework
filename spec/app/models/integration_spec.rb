require 'rails_helper'

RSpec.describe Integration, type: :model do
  it { should have_many(:connections) }
end
