class AddGeolocationToExpeditions < ActiveRecord::Migration[5.0]
  def change
    add_column :expeditions, :geolocation, :string
  end
end
