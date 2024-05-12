# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def order_confirmation(user, order)
    @user = user
    @order = order
    mail(
      from: 'munieru3810@gmail.com',
      to: @user.email,
      subject: '【Zuma-Shop】購入ありがとうございます。'
    )
  end
end
