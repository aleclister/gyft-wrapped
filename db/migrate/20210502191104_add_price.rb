class AddPrice < ActiveRecord::Migration[6.0]
  def change
    add_column :prices, :detail, :string
  end
end
