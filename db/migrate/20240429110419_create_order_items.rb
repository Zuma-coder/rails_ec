# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.string :product_name
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
