class Balance < ApplicationRecord
  include Editable
  has_many :selling_orders
  has_many :expenses
  has_many :customers, through: :selling_orders
  has_many :inventory_purchases, through: :selling_orders
  has_many :products, through: :inventory_purchases
  before_create :fill_sub_total
  before_create :fill_last_date
  scope :last_created, -> { order(created_at: :desc).first }
  scope :list, -> { order(created_at: :desc) }
  validates_presence_of :starting_total
  validates_numericality_of :starting_total, greater_than: 1


  def fill_sub_total
    self.sub_total = self.starting_total
  end

  def fill_last_date
    self.last_day = Date.today.end_of_month
  end

  def created_month
    created_at.strftime("%b %d")
  end

  def self.last_created_month_day
    last_created&.created_at&.strftime("%b %d")
  end

  def selling_order_list
    selling_orders.where(paid: true).includes([:product, :customer])
  end

end
