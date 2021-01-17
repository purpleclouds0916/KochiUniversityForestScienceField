class AddActivationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :new_email, :string, default:nil
  end
end
