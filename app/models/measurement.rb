class Measurement < ApplicationRecord
  belongs_to :user

  validates_presence_of :running, :reading, :coding, :project, :movie
end
