class AddSubjectToTeachingGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :teaching_groups, :subject, :string
  end
end
