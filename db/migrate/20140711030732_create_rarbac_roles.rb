class CreateRarbacRoles < ActiveRecord::Migration
  def change
    create_table :rarbac_roles do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
