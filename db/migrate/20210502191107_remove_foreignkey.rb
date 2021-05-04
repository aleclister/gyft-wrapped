class RemoveForeignkey < ActiveRecord::Migration[6.0]
  def change

    add_foreign_key :relations, :prices, column: :price_range, on_delete: :cascade, on_update: :cascade
  end
end
