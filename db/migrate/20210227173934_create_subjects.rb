class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :abbr
      t.string :sub_id

      t.timestamps
    end
  end
end
