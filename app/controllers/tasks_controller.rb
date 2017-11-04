class TasksController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create]
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    if logged_in?
      @tasks = current_user.tasks.all
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'タスクが正常に追加されました'
      redirect_to @task
    else
      flash[:danger] = 'タスクが追加出来ませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'タスクが正常に追加されました'
      redirect_to @task
    else
      flash[:danger] = 'タスクが追加出来ませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy
    
    flash[:success] = 'タスクが正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  #strong parameter
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def correct_user
    redirect_to root_url if @task.user != current_user
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
