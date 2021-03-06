class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :url
      t.decimal :price, precision: 8, scale: 3
      t.string :sku

      t.timestamps
    end
  end
end
