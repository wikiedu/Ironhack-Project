class CreateExpeditions < ActiveRecord::Migration[5.0]
  def change
    create_table :expeditions do |t|
      t.references :location, index: true
      t.string :sendingType
      t.integer :weight
      t.string :state
      t.timestamps
    end
  end
end
