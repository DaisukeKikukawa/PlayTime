class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:edit, :update]
  before_action :authenticate_user!


  def index
    @user = current_user
    @q = @user.attendances.ransack(params[:q])
    @attendances = @q.result(distinct: true).order(date: :asc)
  end

  def new
    @attendance = Attendance.find_by(date: Date.today,user: current_user) || Attendance.new(date: Date.today)
  end

  def create
    @attendance = Attendance.find_or_initialize_by(date: Date.today,user: current_user)
    if @attendance.update(attendance_params)
      redirect_to user_path(current_user), flash: {notice: "保存しました"}
    else
      flash.now[:alert] = "保存に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    @attendance.date = Date.today
    if @attendance.update(attendance_params)
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "保存に失敗しました"
      render :edit
    end
  end

  private

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:clockin_time, :clockout_time, :break_time).merge(user_id: current_user.id)
  end
end
