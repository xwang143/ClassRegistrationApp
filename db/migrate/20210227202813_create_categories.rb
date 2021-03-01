class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.integer :course_id
      t.integer :subject_id
      t.string :sub_id

      t.timestamps
    end
  end
end
