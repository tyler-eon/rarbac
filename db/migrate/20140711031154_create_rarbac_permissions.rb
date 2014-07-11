class CreateRarbacPermissions < ActiveRecord::Migration
  def change
    create_table :rarbac_permissions do |t|
      t.integer :role_id
      t.integer :action_id

      t.timestamps
    end

    add_index :rarbac_permissions, :role_id
    add_index :rarbac_permissions, :action_id
    add_index :rarbac_permissions, [:role_id, :action_id], unique: true
  end
end
