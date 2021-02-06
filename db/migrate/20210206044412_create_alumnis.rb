class CreateAlumnis < ActiveRecord::Migration[6.0]
  def change
    create_table :alumnis do |t|
      t.string :name
      t.string :job
      t.string :birthplace
      t.string :job_description
      t.text :original_content
      t.string :original_title
      t.text :reason
      t.string :research_field
      t.string :research_office
      t.text :learning
      t.text :memories

      t.timestamps
    end
  end
end
