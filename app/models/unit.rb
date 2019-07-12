class Unit < ApplicationRecord
  validates :title, :order, presence: true
  validates :order, uniqueness: true
  has_many :topics
end
