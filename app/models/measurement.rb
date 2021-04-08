class Measurement < ApplicationRecord
  belongs_to :task
  belongs_to :user

  validates_presence_of :value
end
