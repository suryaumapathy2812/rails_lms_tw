class CreateRoles < ActiveRecord::Migration[6.1]
  def up
    create_table :roles do |t|
      t.string :name, null: false
      t.timestamps
    end
  end


  def down
    drop_table :roles
  end
end
