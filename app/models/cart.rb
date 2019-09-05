class Cart < ApplicationRecord
	belongs_to :user
	has_many :join_table_cart_items
	has_many :items, through: :join_table_cart_items

	def total_price
    # Calculate total price of items in cart
    self.items.sum(:price)
  end
  
	private 

	
end
