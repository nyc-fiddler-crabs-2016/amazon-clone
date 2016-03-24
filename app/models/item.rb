class Item < ActiveRecord::Base
  has_many :reviews
  has_many :raters, through: :reviews
  has_many :item_orders
  has_many :orders, through: :item_orders
  belongs_to :category


end
