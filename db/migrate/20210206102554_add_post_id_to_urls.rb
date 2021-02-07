class AddPostIdToUrls < ActiveRecord::Migration[6.0]
  def change
    add_column :urls, :post_id,:integer, index: true
  end
end
