class AddUsersToLogs < ActiveRecord::Migration[7.1]
  def change
    add_reference :logs, :user, foreign_key: true
  end
end
