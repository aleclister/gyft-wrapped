class RemoveForeignkey < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :relations, :prices, column: :hobbies_id
    add_foreign_key :relations, :prices, column: :price_range, on_delete: :cascade, on_update: :cascade
  end
end
