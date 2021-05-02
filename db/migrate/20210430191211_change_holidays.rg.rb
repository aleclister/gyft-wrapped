class ChangeHolidays < ActiveRecord::Migration[6.0]
  def change
    change_column :holidays, :real_date, :date
  end
end
