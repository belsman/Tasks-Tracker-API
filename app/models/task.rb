class Task < ApplicationRecord
  validates_presence_of :name, :daily_target, :description
end
