class Admin::TalksController < ApplicationController

  before_action :require_admin
  skip_before_action :track_ahoy_visit

  def new
    @talk = Talk.new
  end

  def edit
    @talk = Talk.find_by(id: params[:id])
  end

  def create
    @talk = Talk.new(talk_params)
    if @talk.save
      redirect_to talks_path
    else
      render :new
    end
  end

  def update
    @talk = Talk.find_by(id: params[:id])
    if @talk.update(talk_params)
      redirect_to talks_path
    else
      render :edit
    end
  end

  def destroy
    @talk = Talk.find_by(id: params[:id])
    if @talk
      @talk.destroy
      redirect_to talks_path
    else
      redirect_to talks_path, alert: "Talk not found"
    end
  end

  private

  def talk_params
    params.require(:talk).permit(
      :title, :description, :youtube_link, :blog_post_link,
      :conference_name, :talk_date, :picture_url
    )
  end
end