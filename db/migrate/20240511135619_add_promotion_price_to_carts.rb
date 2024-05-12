# frozen_string_literal: true

class AddPromotionPriceToCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :promotion_price, :integer
  end
end
