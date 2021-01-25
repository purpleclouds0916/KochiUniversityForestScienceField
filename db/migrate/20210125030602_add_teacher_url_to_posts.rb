class AddTeacherUrlToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :teacher_url, :text
  end
end
