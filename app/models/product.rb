# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 24 }
  validates :normal_price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { maximum: 1000 }

  validate :sales_price_must_be_less_than_normal_price

  private

  def sales_price_must_be_less_than_normal_price
    return if sales_price.blank?

    return unless sales_price >= normal_price

    errors.add(:sales_price, :greater_than, count: '通常価格')
  end
end
