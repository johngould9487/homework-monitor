class AddMarkedToAssignment < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :marked, :boolean
  end
end
