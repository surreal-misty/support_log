class Customer < ApplicationRecord
  has_many :interactions, dependent: :destroy
end
