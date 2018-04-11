class CreateSub2LineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :sub2_line_items do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :sub2_category, foreign_key: true

      t.timestamps
    end
  end
end
