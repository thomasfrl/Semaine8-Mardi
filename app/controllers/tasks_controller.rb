class TasksController < ApplicationController
before_action :authenticate_user!
  def new
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params)
    @category = Category.find(category_params)
    @task.category = @category
    if @task.save        
      respond_to do |format|
        format.html{
          redirect_to root_path
          flash[:notice] = "Task created"
        }
        format.js{
          flash.now[:notice] = "Task created"
        }
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all

  end

  def update
    @task = Task.find(params[:id])  
    @task.update(status:params[:status])
    respond_to do |format|
      format.html{
        redirect_to root_path
        flash[:notice] = "Task updated"
      }
      format.js{
        flash.now[:notice] = "Task updated"
      }
    end

  end

  def index
    @tasks = Task.all
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end


  private

  def task_params
    params.permit(:title, :deadline, :description, :status)
  end

  def category_params
    params.require(:Category)
  end

end
