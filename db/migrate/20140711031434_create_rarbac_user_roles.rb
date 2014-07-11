class CreateRarbacUserRoles < ActiveRecord::Migration
  def change
    create_table :rarbac_user_roles do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps
    end

    add_index :rarbac_user_roles, :user_id
    add_index :rarbac_user_roles, :role_id
    add_index :rarbac_user_roles, [:user_id, :role_id], unique: true
  end
end
