class ChangeSystemEventToBeTextInSystemLogs < ActiveRecord::Migration[5.2]
  def change
  	change_column :system_logs, :event_time, :text
  end
end
