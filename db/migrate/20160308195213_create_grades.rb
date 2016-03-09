class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :assignment_name
      t.decimal :grade
      t.datetime :assignment_date
      t.integer :teacher_id
      t.integer :student_id
      t.integer :parent_id

      t.timestamps null: false
    end
  end
end
