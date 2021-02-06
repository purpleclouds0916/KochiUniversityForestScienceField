class RemoveAlumniFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :name, :string
    remove_column :posts, :job, :string
    remove_column :posts, :birthplace, :string
    remove_column :posts, :job_description, :string
    remove_column :posts, :original_content, :text
    remove_column :posts, :original_title, :sting
    remove_column :posts, :reason, :text
    remove_column :posts, :research_field, :string
    remove_column :posts, :research_office, :string
    remove_column :posts, :learning, :text
    remove_column :posts, :memories, :text
  end
end
