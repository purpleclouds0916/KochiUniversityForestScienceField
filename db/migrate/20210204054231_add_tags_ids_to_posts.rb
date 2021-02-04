class AddTagsIdsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :tag_id, :integer, index: true
  end
end
