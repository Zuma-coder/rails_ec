# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def add_item(product_id:, quantity:)
    item = cart_items.find_by(product_id:) || cart_items.build(product_id:)
    if item.quantity.nil?
      item.quantity = quantity.to_i
    else
      item.quantity += quantity.to_i
    end
    item.save
  end

  def update_item(product_id:, quantity:)
    cart_items.find_by(product_id:)
              .update(quantity: quantity.to_i)
  end

  def delete_item(product_id:)
    cart_items.find_by(product_id:)
              .destroy
  end

  def total_quantity
    cart_items.sum(:quantity)
  end

  def total_price
    cart_items.includes(:product).sum do |item|
      item.product.price * item.quantity
    end
  end
end
