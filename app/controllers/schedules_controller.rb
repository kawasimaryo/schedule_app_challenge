class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.all.order(updated_at: :desc)
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:notice] = 'スケジュールを作成しました'
      redirect_to @schedule
    else
      flash.now[:alert] = 'スケジュールの作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      flash[:notice] = 'スケジュールを更新しました'
      redirect_to @schedule
    else
      flash.now[:alert] = 'スケジュールの更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    flash[:notice] = 'スケジュールを削除しました'
    redirect_to schedules_path
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo)
  end
end

