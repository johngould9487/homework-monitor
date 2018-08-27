class CreateTeacherGroupMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_group_memberships do |t|
      t.references :teaching_group, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
