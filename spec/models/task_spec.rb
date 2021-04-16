# spec/models/todo_spec.rb
require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Task, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:daily_target) }
end
