class AddIndexToResumesEmail < ActiveRecord::Migration[5.2]
  def change
  	add_index :resumes, :email, unique: true
  end
end
