class CreateRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :relations do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :address
      t.string :gender
      t.string :relation_to
      t.string :hobbies
      t.integer :user_id

      t.timestamps
    end
  end
end
