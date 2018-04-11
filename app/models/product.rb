class Product < ApplicationRecord
  has_many :line_items
  has_many :categories, through: :line_items

  has_many :sub1_line_items
  has_many :sub1_categories, through: :sub1_line_items

  has_many :sub2_line_items
  has_many :sub2_categories, through: :sub2_line_items

end
