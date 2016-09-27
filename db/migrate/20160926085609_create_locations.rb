class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.references :client, index: true
      t.string :name
      t.string :direction
      t.string :postalCode
      t.time :hourIn
      t.time :hourOut
      t.string :contact
      t.integer :route
      t.timestamps
    end
  end
end
