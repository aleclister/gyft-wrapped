class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :hobby_id
      t.float :price
      t.timestamps
    end
    add_foreign_key  :products,  :hobbies, column: :hobby_id, on_delete: :cascade, on_update: :cascade

  end
end
