class ProjectsController < ApplicationController

  def new
    @project = Project.new
    @title = "New project"
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:success] = "Project created successfully"
      redirect_to @project
    else
      @title = "New project"
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
    @title = @project.title
  end

  def edit
    @project = Project.find(params[:id])
    @title = "Edit project"
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:success] = "Project updated."
      redirect_to @project
    else
      @title = "Edit project"
      render 'edit'
    end
  end

  def index
    @projects = Project.paginate(:page => params[:page])
    @title = "All projects"
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project deleted."
    redirect_to projects_path
  end
end

