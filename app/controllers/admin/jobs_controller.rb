class Admin::JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :require_is_admin

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to admin_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :content, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden)
  end

  def find_job
    @job = Job.find(params[:id])
  end

end
