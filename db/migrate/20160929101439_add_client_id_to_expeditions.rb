class AddClientIdToExpeditions < ActiveRecord::Migration[5.0]
  def change
    add_reference :expeditions, :client, index: true
  end
end
