class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :source_id
      t.string :icaluid
      t.datetime :start_date
      t.datetime :end_date
      t.string :title
      t.text :description
      t.string :location
      t.string :url
      t.string :pricing
      t.string :contact_email
      t.string :organizer
      t.text :geo

      t.timestamps null: false
    end
  end
end
