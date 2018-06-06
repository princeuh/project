class CreateStripeLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :stripe_logs do |t|
      t.text :log

      t.timestamps
    end
  end
end
