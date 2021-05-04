class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings do |t|
      t.belongs_to :hobbies, foreign_key: true
      t.belongs_to :relations, foreign_key: true
      t.timestamps
    end
  end
end
