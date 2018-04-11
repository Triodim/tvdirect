class Sub2Category < ApplicationRecord
  belongs_to :sub1_category

  has_many :sub2_line_items
  has_many :products, through: :sub2_line_items
end
