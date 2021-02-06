class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :job
      t.integer :post_id

      t.timestamps
    end
  end
end
