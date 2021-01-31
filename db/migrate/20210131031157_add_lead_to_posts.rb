class AddLeadToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :lead, :string
  end
end
