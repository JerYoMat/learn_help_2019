class CreateTipTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :tip_topics do |t|
      t.belongs_to :learn_resource
      t.belongs_to :topic
      t.timestamps
    end
  end
end
