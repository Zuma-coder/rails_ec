# frozen_string_literal: true

class Promotion < ApplicationRecord
  validates :code, uniqueness: true
end
