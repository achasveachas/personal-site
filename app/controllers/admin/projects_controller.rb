class Admin::ProjectsController < ApplicationController

  before_action :require_admin

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find_by(id: params[:id])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def update
    @project = Project.find_by(id: params[:id])
    if @project.update_attributes(project_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def delete
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :demo_url, :demo_username, :demo_password, :repo, :blog_post)
  end
end
