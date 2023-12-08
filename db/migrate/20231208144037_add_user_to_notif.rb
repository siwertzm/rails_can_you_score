class AddUserToNotif < ActiveRecord::Migration[7.1]
  def change
    add_reference :notifs, :follow, foreign_key: { to_table: :users }
  end
end
