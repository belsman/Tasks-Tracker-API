class Task < ApplicationRecord
  has_many :measurements, dependent: :destroy
  # validations
  validates_presence_of :name, :daily_target, :description, :measurement_unit
end
