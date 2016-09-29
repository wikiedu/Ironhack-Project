class CreateExpeditions < ActiveRecord::Migration[5.0]
  def change
    create_table :expeditions do |t|
      t.references :location, index: true
      t.integer :origin_location_id
      t.index :origin_location_id
      t.integer :destination_location_id
      t.index :destination_location_id
      t.string :sending_type
      t.integer :weight
      t.string :state
      t.timestamps
    end
  end
end
