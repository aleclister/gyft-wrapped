class RemoveForeign < ActiveRecord::Migration[6.0]
  remove_foreign_key :relations, column: :hobbies_id
end