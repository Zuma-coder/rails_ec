# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    @cart = current_cart
    @user = User.new(user_params)

    begin
      ActiveRecord::Base.transaction do
        @user.save!
        create_order_with_items(@user, @cart)
      end
      redirect_to products_path, notice: '購入ありがとうございます。'
    rescue
      @cart = current_cart
      render 'carts/show', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :email, :zip, :address, :detail_address,
                                 :name_of_card, :card_number, :expiration, :cvv)
  end

  def create_order_with_items(user, cart)
    order = Order.create!(
      user_id: user.id,
      total_price: cart.total_price,
      order_date: Date.today
    )

    cart.cart_items.each do |item|
      next unless item.quantity.positive?

      order.order_items.create!(
        product_name: item.product.name,
        price: item.product.price,
        quantity: item.quantity
      )
    end

    cart.cart_items.destroy_all
  end
end
