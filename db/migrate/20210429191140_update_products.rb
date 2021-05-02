
class UpdateProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :age, :integer
    add_column :products, :gender, :string

  end
end
