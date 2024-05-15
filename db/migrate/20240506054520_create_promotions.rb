# frozen_string_literal: true

class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.string :code
      t.integer :price
      t.boolean :is_used

      t.timestamps
    end
    add_index :promotions, :code, unique: true
  end
end
