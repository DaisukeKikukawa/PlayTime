class AddUniqueConstraintToDateInAttendances < ActiveRecord::Migration[7.0]
  def change
    add_index :attendances, :date, unique: true
  end
end
