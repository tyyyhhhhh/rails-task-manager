class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    set_task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create!(task_params)
   # @task.title = params[:task][:title]
   # @task.details = params[:task][:details]
    # @task.save!

    redirect_to tasks_path(@task)
  end

  def edit
    set_task
  end

  def update
    set_task
    @task.update(task_params)

    redirect_to task_path
  end

  def destroy
   set_task
   @task.destroy
   redirect_to tasks_path
  end

private
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
