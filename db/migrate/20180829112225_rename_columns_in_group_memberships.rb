class RenameColumnsInGroupMemberships < ActiveRecord::Migration[5.2]
  def change
    rename_column :student_group_memberships, :teaching_group_id, :student_teaching_group_id
    rename_column :teacher_group_memberships, :teaching_group_id, :teacher_teaching_group_id
  end
end
