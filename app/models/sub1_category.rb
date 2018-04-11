class Sub1Category < ApplicationRecord
  belongs_to :category

  has_many :sub2_categories, dependent: :destroy

  has_many :sub1_line_items
  has_many :products, through: :sub1_line_items
end
