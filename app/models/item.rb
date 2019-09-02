class Item < ApplicationRecord
	has_many :join_table_cart_items
	has_many :carts, through: :join_table_cart_items
end
