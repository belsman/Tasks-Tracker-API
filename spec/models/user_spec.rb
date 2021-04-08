# spec/models/item_spec.rb
require 'rails_helper'

# Test suite for the Item model
RSpec.describe User, type: :model do
  it { should have_many(:measurements).dependent(:destroy) }
  # ensure column name is present before saving
  it { should validate_presence_of(:username) }
end
