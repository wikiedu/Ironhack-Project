class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.references :client, index: true
      t.string :internal_code
      t.string :name
      t.string :direction
      t.string :postal_code
      t.time :hour_in
      t.time :hour_out
      t.string :contact
      t.integer :route
      t.timestamps
    end
  end
end
