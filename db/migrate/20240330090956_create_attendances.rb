class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.time :clockin_time
      t.time :clockout_time
      t.integer :break_time
      t.string :attendance_type

      t.timestamps
    end
  end
end
