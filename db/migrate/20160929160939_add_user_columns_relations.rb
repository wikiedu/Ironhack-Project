class AddUserColumnsRelations < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role, :string
    add_reference :users, :company, index: true
  end
end
