class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @q = @user.attendances.ransack(params[:q])
    @attendances = @q.result(distinct: true).order(date: :asc)
  end

  def download_csv
    @user = User.find(params[:id])
    @attendances = @user.attendances.ransack(params[:q]).result(distinct: true).order(date: :asc)

    csv_data = CSV.generate do |csv|
      csv << ["日付", "出勤時間", "退勤時間"]
      @attendances.each do |attendance|
        csv << [attendance.date, attendance.clockin_time, attendance.clockout_time]
      end
    end
    send_data(csv_data, filename: "勤怠一覧.csv")
  end

end
