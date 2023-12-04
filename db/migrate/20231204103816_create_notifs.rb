class CreateNotifs < ActiveRecord::Migration[7.1]
  def change
    create_table :notifs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :training, null: false, foreign_key: true

      t.timestamps
    end
  end
end
