class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @project.phases.build
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
  end

  def update
    if @project.update(project_params)
      redirect_to edit_project_path(@project), notice: 'Project updated successfully'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @project.phases.each {|phase| phase.delete} #Destroy related phases
    @project.delete
    redirect_to projects_path, notice: 'Project was deleted successfully'
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, phases_attributes:
    [:name, :id, :_destroy])
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
