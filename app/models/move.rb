# frozen_string_literal: true

class Move < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :move_type, presence: true

  enum move_type: {
    block: 0,
    hand: 1,
    kick: 2
  }

  enum belt_level: {
    white: 0,
    orange: 1,
    purple: 2,
    blue: 3,
    green: 4
  }
end
