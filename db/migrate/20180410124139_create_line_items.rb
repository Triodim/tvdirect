class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
