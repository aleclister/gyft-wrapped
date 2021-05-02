class NewUpdateHolidays < ActiveRecord::Migration[6.0]
  def change
    add_column :holidays, :real_date, :datetime
  end
end