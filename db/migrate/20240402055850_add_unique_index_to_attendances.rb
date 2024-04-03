class AddUniqueIndexToAttendances < ActiveRecord::Migration[7.0]
  def change
    remove_index :attendances, :date if index_exists?(:attendances, :date)
    add_index :attendances, [:user_id, :date], unique: true
  end
end
