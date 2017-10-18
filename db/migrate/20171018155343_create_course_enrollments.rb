class CreateCourseEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :course_enrollments do |t|
      t.integer :user_id
      t.integer :course_id
      t.timestamps
    end
    add_index :course_enrollments, [:user_id, :course_id]
  end
end
