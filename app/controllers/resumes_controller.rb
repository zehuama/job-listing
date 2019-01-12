class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_job

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.job = @job
    @resume.user = current_user
    if @resume.save
      redirect_to job_path(@job), notice: "成功提交履历"
    else
      render :new
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:description, :attachment)
  end

  def find_job
    @job = Job.find(params[:job_id])
  end
end
