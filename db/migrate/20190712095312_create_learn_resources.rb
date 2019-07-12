class CreateLearnResources < ActiveRecord::Migration[5.2]
  def change
    create_table :learn_resources do |t|
      t.string :title
      t.belongs_to :user, foreign_key: true
      t.string :url
      t.timestamps
    end
  end
end
