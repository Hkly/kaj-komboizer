require "csv"
CSV::Converters[:downcase] = ->(value) { value.downcase rescue value }

namespace :moves do
  desc "Replaces all moves in database with new moves from csv file"
  task import: ["moves:clear", :environment] do
    raw_file = File.read("moves_list.csv")
    csv = CSV.parse(raw_file, headers: true, header_converters: :symbol, converters: :downcase)

    csv.each do |row|
      move = Move.create(row.to_hash)
      unless move.valid?
        puts move.errors.details
      end
    end
  end

  desc "Clear all moves from database"
  task clear: :environment do
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE moves RESTART IDENTITY")
  end
end
