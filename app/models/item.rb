class Item < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged

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
						numericality:{in: 1.00..1000.00}
	validates :image_url,
						presence: true

	friendly_id :title, use: [:slugged, :finders]


end
