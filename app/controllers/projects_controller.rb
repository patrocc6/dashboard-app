class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def index

  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project created successfully'
    else
      render :new
    end
  end

  def show

  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
