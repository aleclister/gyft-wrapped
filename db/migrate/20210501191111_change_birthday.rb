class ChangeBirthday < ActiveRecord::Migration[6.0]
  def change
    change_column :relations, :date_of_birth, :string
  end
end
