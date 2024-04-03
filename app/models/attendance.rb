class Attendance < ApplicationRecord
  belongs_to :user
  validates :clockin_time, presence: true
  validates :date, uniqueness: { scope: :user_id }, presence: true

  # 検索可能な属性
  def self.ransackable_attributes(auth_object = nil)
    ["attendance_type", "break_time", "clockin_time", "clockout_time", "created_at", "date", "id", "updated_at", "user_id","year","month"]
  end

  # 検索可能な関連
  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  ransacker :year do
    Arel.sql("extract(year from date)")
  end

  ransacker :month do
    Arel.sql("extract(month from date)")
  end
end
