class UpdateHolidays < ActiveRecord::Migration[6.0]
  def change
    add_column :holidays, :date, :string
  end
end