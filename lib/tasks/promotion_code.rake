# frozen_string_literal: true

namespace :promotion_code do
  desc '7桁の英数字のプロモーションコードを10個生成する'
  task generate: :environment do
    10.times do
      code = SecureRandom.alphanumeric(7)
      price = rand(100..1000)
      Promotion.create!(code:, price:)
    end
  end
end
