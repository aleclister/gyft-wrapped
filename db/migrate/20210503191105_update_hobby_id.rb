class UpdateHobbyId < ActiveRecord::Migration[6.0]
  def change
    change_column :relations, :hobbies_id, :integer, array: true , default:[]
  end
end
