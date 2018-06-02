class AddPasswordDigestToResumes < ActiveRecord::Migration[5.2]
  def change
    add_column :resumes, :password_digest, :string
  end
end
