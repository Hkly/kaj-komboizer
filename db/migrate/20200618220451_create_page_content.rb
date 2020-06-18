class CreatePageContent < ActiveRecord::Migration[6.0]
  def change
    create_table :page_contents do |t|
      t.string :page_name, null: false, unique: true
      t.text :content_body
    end
  end
end
