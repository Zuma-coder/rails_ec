# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def current_cart
    current_cart = Cart.includes(cart_items: :product).find_by(id: session[:cart_id])
    if current_cart.nil?
      current_cart = Cart.create
      session[:cart_id] = current_cart.id
    end

    current_cart
  end
end
