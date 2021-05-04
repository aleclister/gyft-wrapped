class ChangeHobby < ActiveRecord::Migration[6.0]
  def change
    change_column :relations, :hobbies_id, :string
  end
end