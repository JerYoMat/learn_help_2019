# frozen_string_literal: true

class CreateJoinTableLearnResourceTopic < ActiveRecord::Migration[5.2]
  def change
    create_join_table :learn_resources, :topics do |t|
      t.index %i[learn_resource_id topic_id]
    end
  end
end
