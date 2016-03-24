class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :address
  belongs_to :cart
  has_many :item_orders
  has_many :items, through: :item_orders
end
