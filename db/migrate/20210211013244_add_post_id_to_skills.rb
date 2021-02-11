class AddPostIdToSkills < ActiveRecord::Migration[6.0]
  def change
    add_column :skills, :post_id, :integer
  end
end
