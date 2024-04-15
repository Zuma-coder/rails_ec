# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @products = Product.order(created_at: :desc)
                       .limit(4)
    @product = Product.find(params[:id])
  end
end
