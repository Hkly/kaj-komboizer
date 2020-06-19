ActiveAdmin.register Move do
  permit_params :name, :move_type, :belt_level

  collection_action :upload_csv
  collection_action :import_csv, method: :post do
    require 'csv'
    CSV::Converters[:downcase] = ->(value) { value.downcase rescue value }

    ActiveRecord::Base.connection.execute('TRUNCATE TABLE moves RESTART IDENTITY')

    raw_file = File.read(params[:moves_file][:file])
    csv = CSV.parse(raw_file, headers: true,
                              header_converters: :symbol,
                              converters: :downcase)

    csv.each do |row|
      Move.create!(row.to_hash)
    end

    redirect_to collection_path, notice: 'Import Complete!'
  rescue ActiveRecord::RecordInvalid => e
    redirect_to collection_path, flash: { error: "Import Incomplete - #{e.message}" }
  end

  action_item only: :index do
    link_to 'Import CSV', action: 'upload_csv'
  end

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
