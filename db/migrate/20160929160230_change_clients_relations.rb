class ChangeClientsRelations < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :user_id
    add_reference :clients, :company, index: true
  end
end
