# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @cart = current_cart
    @user = User.new
    @promotion = Promotion.new
  end

  def update
    @cart = current_cart
    Promotion.find_by(code: promotion_params[:code])
    if @cart.can_apply_promotion?(promotion_params[:code])
      redirect_to cart_path, notice: 'プロモーションコードが正常に適用されました。'
    else
      @promotion = Promotion.new(promotion_params)
      flash.now[:alert] = '無効なプロモーションコード、またはすでに使用されています。'
      render :show, status: :unprocessable_entity
    end
  end

  private

  def promotion_params
    params.require(:promotion).permit(:code)
  end
end
