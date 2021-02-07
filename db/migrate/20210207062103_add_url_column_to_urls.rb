class AddUrlColumnToUrls < ActiveRecord::Migration[6.0]
  def change
    add_column :urls, :movie_url, :string
    add_column :urls, :teacher_hp_url, :string
    add_column :urls, :external_url, :string
  end
end
