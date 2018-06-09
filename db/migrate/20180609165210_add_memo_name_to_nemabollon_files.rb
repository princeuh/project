class AddMemoNameToNemabollonFiles < ActiveRecord::Migration[5.2]
  def change
    add_column :nemabollon_files, :memo_name, :string
  end
end
