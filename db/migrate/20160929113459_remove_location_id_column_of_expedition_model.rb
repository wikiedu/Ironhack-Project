class RemoveLocationIdColumnOfExpeditionModel < ActiveRecord::Migration[5.0]
  def change
    remove_column :expeditions, :location_id
  end
end
