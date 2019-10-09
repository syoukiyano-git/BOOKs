class AddRateToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :author, :string
    add_column :products, :release_date, :string
  end
end
