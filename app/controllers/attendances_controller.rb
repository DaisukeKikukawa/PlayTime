class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:clockin_time, :clockout_time, :break_time,:date).merge(user_id: current_user.id)
  end
end
