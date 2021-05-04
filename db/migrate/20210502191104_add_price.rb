class AddPrice < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.string :detail
      t.float :from
      t.float :to
      t.timestamps

    end

  end
end
