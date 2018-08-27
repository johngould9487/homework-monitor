class CreateStudentGroupMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :student_group_memberships do |t|
      t.references :teaching_group, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
