class AddAlumniColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :birthplace, :string
    add_column :posts, :job, :string
    add_column :posts, :research_office, :string
    add_column :posts, :research_field, :string
  end
end
