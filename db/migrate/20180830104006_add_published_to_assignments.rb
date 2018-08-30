class AddPublishedToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :published, :boolean, default: false
  end
end
