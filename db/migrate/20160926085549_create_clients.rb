class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.references :user, index: true
      t.string :name
      t.string :contact
      t.timestamps
    end
  end
end
