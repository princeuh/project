class AddUsersIdToSystemLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :system_logs, :users_id, :integer
  end
end
