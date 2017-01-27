class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    authorize Project
    @project = Project.new
    phase = @project.phases.build
    phase.tasks.build
  end

  def create
    @project = Project.new(project_params)

    if @project.save!
      redirect_to @project, notice: 'Project created successfully'
    else
      render :new
    end
  end

  def edit
    if current_user.admin?
      render :edit
    else
      redirect_to root_path, notice: 'Not allowed to edit projects'
    end
  end

  def update
    authorize @project
    if @project.update(project_params)
      redirect_to edit_project_path(@project), notice: 'Project updated successfully'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @project.delete
    redirect_to projects_path, notice: 'Project was deleted successfully'
  end

  private

  def project_params
    params.require(:project).permit(:name, :description,
    phases_attributes: [
      :name, :id, :_destroy,
      tasks_attributes: [:name, :lead_time, :id, :_destroy]
    ]
    )
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def user_not_authorized
    flash[:alert] = "You do not have permission to perform that action"
    redirect_to(root_path)
  end
end
