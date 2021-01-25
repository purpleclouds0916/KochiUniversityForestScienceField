class AddUrlToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :video_url, :text
    add_column :posts, :external_url, :text
  end
end
