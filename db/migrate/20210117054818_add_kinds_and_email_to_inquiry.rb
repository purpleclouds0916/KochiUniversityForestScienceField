class AddKindsAndEmailToInquiry < ActiveRecord::Migration[6.0]
  def change
    add_column :inquiries, :email, :string
    add_column :inquiries, :kinds, :string
  end
end
