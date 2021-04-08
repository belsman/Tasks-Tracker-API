class User < ApplicationRecord
  has_many :measurements, dependent: :destroy

  validates_presence_of :username
end
