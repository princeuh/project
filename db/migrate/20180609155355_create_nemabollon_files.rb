class CreateNemabollonFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :nemabollon_files do |t|
      t.string :content_creator
      t.string :memo

      t.timestamps
    end
  end
end
