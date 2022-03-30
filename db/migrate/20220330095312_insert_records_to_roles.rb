class InsertRecordsToRoles < ActiveRecord::Migration[6.1]
  def up
    Role.create(:name => "ADMIN")
    Role.create(:name => "TRAINER")
    Role.create(:name => "STUDENT")
  end

  def down
    Role.delete_all
  end
end
