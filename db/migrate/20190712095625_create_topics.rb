class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :title
      t.belongs_to :unit, foreign_key: true
      t.integer :order
      t.timestamps
    end
  end
end
