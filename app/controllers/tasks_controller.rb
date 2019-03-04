class TasksController < ApplicationController
  before_action :set_lists
  before_action :set_tasks, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Lists.task.all
  end

  def show
  end

  def new
    @task = @list.tasks.new
  end

  def create
    @task = @list.tasks.new(task_params)

      if @task.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end


  def edit
  end

  def update
    if  @task.update(task_params)
      redirect_to list_task_path
    else
      render :edit
    end

  end

  def destroy
    @task.destroy
    redirect_to list_task_path
  end
  
  private
  def task_params
    params.require(:task).permit(:name)
  end

  def set_tasks
    @task = Task.find(params[:id])
  end

  def set_lists
    @list = List.find(params[:list_id])
  end


end
