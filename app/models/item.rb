# frozen_string_literal: true

class Item < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :join_table_cart_items
  has_many :carts, through: :join_table_cart_items
  has_many :join_table_order_items
  has_many :orders, through: :join_table_order_items
  has_one_attached :avatar

  validates :title, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 30 }
  validates :price, presence: true, numericality: { in: 0.99..999.99 }

  # for admin table
  def avatar_attached?
    avatar.attached?
  end
end
