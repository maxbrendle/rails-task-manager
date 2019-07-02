class TasksController < ApplicationController
  # read all
  def index
    @tasks = Task.all
  end

  # read one
  def show
    @task = Task.find(params[:id])
  end
  def new
    @task = Task.new()
  end

  def create
    Task.create(user_input)
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(user_input)
    redirect_to task_path(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def user_input
    params.require(:task).permit(:title, :details, :completed)
 end
end
