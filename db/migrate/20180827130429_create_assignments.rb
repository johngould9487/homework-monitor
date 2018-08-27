class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.date :date_created
      t.date :date_due
      t.string :title
      t.text :description
      t.string :grading_type
      t.integer :maximum_score
      t.references :teaching_group, foreign_key: true

      t.timestamps
    end
  end
end
