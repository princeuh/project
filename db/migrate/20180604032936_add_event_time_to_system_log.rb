class AddEventTimeToSystemLog < ActiveRecord::Migration[5.2]
  def change
    add_column :system_logs, :event_time, :time
  end
end
