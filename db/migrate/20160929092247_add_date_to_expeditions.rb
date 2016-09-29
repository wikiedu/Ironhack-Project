class AddDateToExpeditions < ActiveRecord::Migration[5.0]
  def change
    add_column :expeditions, :date, :date
  end
end
