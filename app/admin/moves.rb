ActiveAdmin.register Move do
  permit_params :name, :move_type, :belt_level

  index do
    column :name
    column :move_type
    column :belt_level

    actions
  end

  filter :name
  filter :move_type, as: :select, collection: Move.move_types
  filter :belt_level, as: :select, collection: Move.belt_levels
end
