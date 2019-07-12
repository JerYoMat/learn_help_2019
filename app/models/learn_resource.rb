# frozen_string_literal: true

# The class that stores the various resources recommended by users
class LearnResource < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
  validates :url, presence: true, uniqueness: true
  
  belongs_to :user
  has_many :tip_topics
  has_many :topics, through: :tip_topics
end
