class CreateRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :relations do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :address
      t.string :gender
      t.integer :relation_to
      t.integer :hobbies_id
      t.integer :user_id
      t.timestamps

    end

    add_foreign_key  :relations, :hobbies , column: :hobbies_id, on_delete: :cascade, on_update: :cascade
    add_foreign_key  :relations,  :users, column: :user_id, on_delete: :cascade, on_update: :cascade
    add_foreign_key  :relations,  :relationships, column: :relation_to, on_delete: :cascade, on_update: :cascade
  end

end
