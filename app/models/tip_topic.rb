class TipTopic < ApplicationRecord
  belongs_to :learn_resource
  belongs_to :topic
end
