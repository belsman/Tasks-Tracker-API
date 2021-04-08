# spec/models/todo_spec.rb
require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Task, type: :model do
  # Association test
  # ensure Task model has a 1:m relationship with the Measurement model
  it { should have_many(:measurements).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:measurement_unit) }
  it { should validate_presence_of(:daily_target) }
end
