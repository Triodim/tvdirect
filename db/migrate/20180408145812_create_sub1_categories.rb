class CreateSub1Categories < ActiveRecord::Migration[5.0]
  def change
    create_table :sub1_categories do |t|
      t.string :name
      t.string :url
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
