class CreateCategoriesProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_products do |t|
      t.references :category, index: true
      t.references :product, index: true
    end
    # add_index :categories_products, :category
    # add_index :categories_products, :product
  end
end
