class AddSummaryToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :summary, :text
  end
end
