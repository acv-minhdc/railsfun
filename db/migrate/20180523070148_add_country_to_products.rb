class AddCountryToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :country, :string, limit: 10
  end
end
