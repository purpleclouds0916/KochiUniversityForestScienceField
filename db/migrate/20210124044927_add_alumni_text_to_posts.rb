class AddAlumniTextToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :reason, :text
    add_column :posts, :learning, :text
    add_column :posts, :job_description, :text
    add_column :posts, :memories, :text
    add_column :posts, :original_title, :string
    add_column :posts, :original_content, :text
  end
end
