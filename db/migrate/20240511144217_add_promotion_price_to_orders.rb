# frozen_string_literal: true

class AddPromotionPriceToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :promotion_price, :integer
  end
end
