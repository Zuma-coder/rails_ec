# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :email
      t.string :zip
      t.string :address
      t.string :detail_address
      t.string :name_of_card
      t.string :card_number
      t.string :expiration
      t.string :cvv

      t.timestamps
    end
  end
end
