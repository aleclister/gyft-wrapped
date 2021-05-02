class ChangeRelations < ActiveRecord::Migration[6.0]
  def change
    change_column :relations, :date_of_birth, :datetime
  end
end