# frozen_string_literal: true

8.times do |i|
  normal_price = [1000, 1500, 2000].sample
  sales_price = rand < 0.5 ? normal_price / 2 : nil

  product = Product.create!(
    name: "商品#{i + 1}",
    code: "ABC#{i + 1}",
    normal_price:,
    sales_price:,
    description: "商品#{i + 1}の説明です",
    created_at: Time.zone.now,
    updated_at: Time.zone.now
  )

  image_path = Rails.root.join('storage', "image#{i + 1}.png")
  product.image.attach(io: File.open(image_path), filename: "image#{i + 1}.png")
end
