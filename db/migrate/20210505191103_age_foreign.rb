class AgeForeign < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :products, :ages , column: :age
  end
end
