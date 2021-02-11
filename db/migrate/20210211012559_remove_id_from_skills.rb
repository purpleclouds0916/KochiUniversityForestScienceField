class RemoveIdFromSkills < ActiveRecord::Migration[6.0]
  def change
    remove_column :skills, :post_id, :integer
  end
end
