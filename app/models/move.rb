class Move < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :move_type, presence: true, inclusion: { in: %w[kick block hand]}
end
