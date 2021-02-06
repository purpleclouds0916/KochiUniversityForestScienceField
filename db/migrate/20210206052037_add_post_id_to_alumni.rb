class AddPostIdToAlumni < ActiveRecord::Migration[6.0]
  def change
    add_column :alumnis, :post_id, :integer
  end
end
