class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def destroy
    @task.destroy
  end

  def update
    respond_to do |format|
      if @task.update(format_date_input(task_params))
        format.js
      else
        format.js
      end
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :start_date, :end_date)
  end

  def format_date_input(task_params)
    task_params[:start_date] = '' if task_params[:start_date] == 'N/A'
    task_params[:end_date] = '' if task_params[:end_date] == 'N/A'

    if !task_params[:start_date].empty?
      task_params[:start_date] = date_format_helper(task_params[:start_date])
    else
      task_params[:start_date] = nil
    end

    if !task_params[:end_date].empty?
      task_params[:end_date] = date_format_helper(task_params[:end_date])
    else
      task_params[:end_date] = nil
    end

    task_params
  end

  def date_format_helper(date)
    Date.strptime(date, '%m/%d/%Y').to_s
  end
end
