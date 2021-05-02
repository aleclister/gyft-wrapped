class UpdateRelations < ActiveRecord::Migration[6.0]
  def change
    add_column :relations, :age, :integer


  end
end