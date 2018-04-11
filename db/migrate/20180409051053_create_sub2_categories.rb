class CreateSub2Categories < ActiveRecord::Migration[5.0]
  def change
    create_table :sub2_categories do |t|
      t.string :name
      t.string :url
      t.belongs_to :sub1_category, foreign_key: true

      t.timestamps
    end
  end
end
