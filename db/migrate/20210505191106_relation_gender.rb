class RelationGender < ActiveRecord::Migration[6.0]
  def change
    change_column :relations, :gender, :integer
    add_foreign_key :relations, :genders, column: :gender
  end
end
