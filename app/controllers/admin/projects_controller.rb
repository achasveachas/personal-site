class Admin::ProjectsController < ApplicationController

  before_action :require_admin
  skip_before_action :track_ahoy_visit


  def new
    @project = Project.new
  end

  def edit
    @project = Project.find_by(id: params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.blog_title = @project.blog_post if @project.blog_title.empty?
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def update
    @project = Project.find_by(id: params[:id])
    if @project.update(project_params)
      @project.blog_title = @project.blog_post if @project.blog_title.empty?
      @project.save
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find_by(id: params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :demo_url, :demo_username, :demo_password, :repo, :blog_post, :blog_title)
  end
end
