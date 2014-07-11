class CreateRarbacActions < ActiveRecord::Migration
  def change
    create_table :rarbac_actions do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
