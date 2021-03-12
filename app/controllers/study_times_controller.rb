class StudyTimesController < ApplicationController

  def index
    @user = current_user
    @study_time = StudyTime.all
  end

  def edit
  end

  def new
  end

  def create
    study_time = StudyTime.new(study_time_params)
    study_time.user_id = current_user.id
    study_time.save
    redirect_to study_times_path
  end

  def update
    user = current_user
    study_time = user.study_times.last
    if study_time.update(study_time_params)
    redirect_to study_times_path
    end
  end

  def destroy
  end


  private
  def study_time_params
    params.require(:study_time).permit(:user_id, :memo )
  end

end
