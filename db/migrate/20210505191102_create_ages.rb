class CreateAges < ActiveRecord::Migration[6.0]
  def change
    create_table :ages do |t|
      t.string :details
      t.integer :from_age
      t.integer :to_age
      t.timestamps
    end
  end
end
