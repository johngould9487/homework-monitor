class ChangeGroupMembershipsColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :student_group_memberships, :user_id, :student_id
    rename_column :teacher_group_memberships, :user_id, :teacher_id
  end
end
