class CreateSystemLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :system_logs do |t|
      t.string :system_event

      t.timestamps
    end
  end
end
