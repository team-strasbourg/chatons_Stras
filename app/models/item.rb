class Item < ApplicationRecord
	has_many :join_table_cart_items
	has_many :carts, through: :join_table_cart_items
	has_many :join_table_order_items
  has_many :orders, through: :join_table_order_items

	validates :title,
						presence: true,
						length: { minimum: 2}
	validates :description,
						presence: true,
						length: { minimum: 30}
	validates :price,
						presence: true,
						in: 1.00..1000..00

end
