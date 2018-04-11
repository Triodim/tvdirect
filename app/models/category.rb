class Category < ApplicationRecord
  has_many :sub1_categories, dependent: :destroy
  has_many :sub2_categories, through: :sub1_categories, dependent: :destroy
  has_many :line_items
  has_many :products, through: :line_items


  validates :name, uniqueness: true
  validates :url, uniqueness: true
end
