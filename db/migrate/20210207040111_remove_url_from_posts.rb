class RemoveUrlFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :url_references, :string
    remove_column :posts, :video_url, :string
    remove_column :posts, :external_url, :string
    remove_column :posts, :teacher_url, :string
  end
end
