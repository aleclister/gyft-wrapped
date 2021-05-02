class AddRelations < ActiveRecord::Migration[6.0]
  def change
    add_column :relations, :price_range, :float
  end
end