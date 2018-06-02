class AddCareerToResumes < ActiveRecord::Migration[5.2]
  def change
    add_reference :resumes, :career, foreign_key: true
  end
end
