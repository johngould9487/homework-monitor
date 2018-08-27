class CreateTeachingGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :teaching_groups do |t|
      t.string :group_code
      t.string :course

      t.timestamps
    end
  end
end
