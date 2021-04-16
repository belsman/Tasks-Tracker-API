# spec/models/item_spec.rb
require 'rails_helper'

# Test suite for the Item model
RSpec.describe Measurement, type: :model do
  # Association test
  # ensure a measured record belongs to a single task record
  it { should belong_to(:user) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:running) }
  it { should validate_presence_of(:coding) }
  it { should validate_presence_of(:reading) }
  it { should validate_presence_of(:project) }
  it { should validate_presence_of(:movie) }
end
