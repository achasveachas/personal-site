class Admin::ProjectsController < ApplicationController

  before_action :require_admin

  def new
    @project = Project.new
  end

  def edit
    @project = Preject.find_by(id: params[:id])
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
  end

  def delete
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :demo_url, :demo_username, :demo_password, :repo, :blog_post)
  end
end
