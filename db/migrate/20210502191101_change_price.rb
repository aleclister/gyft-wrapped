class ChangePrice < ActiveRecord::Migration[6.0]
  def change
    change_column :relations, :price_range, :integer
  end
end