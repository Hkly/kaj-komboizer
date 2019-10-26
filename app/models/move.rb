class Move < ApplicationRecord
  MOVE_TYPES = %w[kick block hand]
  validates :name, presence: true, uniqueness: true
  validates :move_type, presence: true, inclusion: { in: MOVE_TYPES}
end
