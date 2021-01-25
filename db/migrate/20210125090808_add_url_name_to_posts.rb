class AddUrlNameToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :url_references, :string
  end
end
