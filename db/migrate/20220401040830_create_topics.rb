class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.references :course, null: false, foreign_key: true
      t.string :name
      t.text :summary
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
