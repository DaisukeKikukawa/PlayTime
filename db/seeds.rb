user = User.first # 既存のユーザーを取得
90.times do |n|
  date = (Date.today - 90.days + n.days)
  clockin_time = Time.current.beginning_of_day + 9.hours # 午前9時
  clockout_time = clockin_time + 8.hours # 午後5時
  break_time = 60 

  user.attendances.create!(
    date: date,
    clockin_time: clockin_time,
    clockout_time: clockout_time,
    break_time: break_time
  )
end
