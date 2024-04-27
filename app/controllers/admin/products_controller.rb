# frozen_string_literal: true

module Admin
  class ProductsController < ApplicationController
    http_basic_authenticate_with name: 'admin', password: 'pw'
    before_action :set_product, only: %i[show edit update destroy]

    def index
      @products = Product.with_attached_image.all
    end

    def show
      @products = Product.with_attached_image
                         .order(created_at: :desc)
                         .limit(4)
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_products_path, notice: '商品を登録しました。'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @product.update(product_params)
        redirect_to admin_product_path(@product), notice: '商品を更新しました。'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @product.destroy
      redirect_to admin_products_path, notice: '商品を削除しました。', status: :see_other
    end

    private

    def product_params
      params.require(:product).permit(:name, :code, :normal_price, :sales_price, :description, :image)
    end

    def set_product
      @product = Product.find(params[:id])
    end
  end
end
