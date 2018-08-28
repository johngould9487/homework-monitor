class AddColumnToFamilyConnections < ActiveRecord::Migration[5.2]
  def change
    add_column :family_connections, :guardian_id, :integer
    add_foreign_key :family_connections, :users, column: :guardian_id
    add_index :family_connections, :guardian_id

    add_column :family_connections, :student_id, :integer
    add_foreign_key :family_connections, :users, column: :student_id
    add_index :family_connections, :student_id
  end
end
