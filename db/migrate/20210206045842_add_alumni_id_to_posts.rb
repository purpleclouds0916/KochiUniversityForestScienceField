class AddAlumniIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :alumni_id, :integer, index: true
  end
end
