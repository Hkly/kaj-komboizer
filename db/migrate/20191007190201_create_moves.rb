class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.string :name, null: false, unique: true
      t.string :move_type, null: false
      t.string :belt_level
    end
  end
end
