class RenameUserReferenceInAttempts < ActiveRecord::Migration[5.2]
  def change
    rename_column :attempts, :user_id, :student_id
  end
end
