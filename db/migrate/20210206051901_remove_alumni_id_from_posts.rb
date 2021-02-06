class RemoveAlumniIdFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :alumni_id, :integer
  end
end
