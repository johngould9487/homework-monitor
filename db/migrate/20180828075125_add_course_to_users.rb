class AddCourseToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :course, :string
  end
end
