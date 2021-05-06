class ProductGender < ActiveRecord::Migration[6.0]
  change_column :products, :gender, :integer
  add_foreign_key :products, :genders, column: :gender
end
