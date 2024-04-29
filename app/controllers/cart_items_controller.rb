# frozen_string_literal: true

class CartItemsController < ApplicationController
  def create
    return unless current_cart.add_item(product_id: params[:product_id], quantity: params[:quantity])

    redirect_to products_path
  end

  def update
    return unless current_cart.update_item(product_id: params[:product_id], quantity: params[:quantity])

    redirect_to carts_path
  end

  def destroy
    return unless current_cart.delete_item(product_id: params[:product_id])

    redirect_to carts_path
  end
end
