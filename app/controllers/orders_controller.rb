# frozen_string_literal: true

class OrdersController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'pw'

  def index
    @orders = Order.all
  end

  def show
    @order = Order.includes(:order_items, :user)
                  .find(params[:id])
  end
end
