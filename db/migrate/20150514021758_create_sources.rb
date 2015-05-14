class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.string :format
      t.string :url
      t.boolean :approved, default: false

      t.timestamps null: false
    end
  end
end
