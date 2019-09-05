# frozen_string_literal: true

class JoinTableCartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
end
