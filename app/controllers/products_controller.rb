# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.with_attached_image.all
  end

  def show
    @products = Product.with_attached_image
                       .order(created_at: :desc)
                       .limit(4)
    @product = Product.find(params[:id])
  end
end
