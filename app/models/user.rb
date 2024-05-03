# frozen_string_literal: true

class User < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :first_name, presence: true, length: { maximum: 24 }
  validates :last_name, presence: true, length: { maximum: 24 }
  validates :user_name, length: { maximum: 24 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :zip, format: { with: /\A\d{3}-?\d{4}\z/ }
  validates :address, length: { maximum: 100 }
  validates :detail_address, length: { maximum: 100 }
  validates :name_of_card, presence: true
  validates :card_number, presence: true
  validates :expiration, presence: true, length: { maximum: 5 },
                         format: { with: %r{\A\d{2}/\d{2}\z} }
  validates :cvv, presence: true, length: { maximum: 3 },
                  format: { with: /\A\d{3}\z/ }
end
