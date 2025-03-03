class Review < ApplicationRecord
  belongs_to :car
  validates :comment, :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
end
