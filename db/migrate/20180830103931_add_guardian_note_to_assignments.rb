class AddGuardianNoteToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :guardian_note, :text
  end
end
