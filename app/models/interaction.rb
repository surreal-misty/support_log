class Interaction < ApplicationRecord
  belongs_to :customer
  belongs_to :user

  validates :occurred_at, presence: true
end
