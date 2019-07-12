class Topic < ApplicationRecord
  validates :unit, :title, presence: true, length: { maximum: 255 }
  validates :order, presence: true, uniqueness: true
  belongs_to :unit
  has_many :tip_topics
  has_many :learn_resources, through: :tip_topics
end
