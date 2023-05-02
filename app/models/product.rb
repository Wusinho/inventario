class Product < ApplicationRecord
  belongs_to :provider
  has_many :inventory_purchases
  accepts_nested_attributes_for :inventory_purchases, allow_destroy: true
  validates_presence_of :name
  validate :tag_list_empty
  has_many :product_categories
  has_many :categories, through: :product_categories

  def tag_list_empty
    return unless tag_list.blank?

    errors.add(:tag_list, 'Categories cannot be empty')
  end

end
