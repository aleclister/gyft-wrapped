class CreatePrices < ActiveRecord::Migration[6.0]
  rename_column :prices, :from , :from_price
  rename_column :prices, :to , :to_price
end
