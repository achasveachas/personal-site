class Admin::VisitsController < ApplicationController

  before_action :require_admin
  skip_before_action :track_ahoy_visit

  def index
    @visits = Ahoy::Visit.all
  end

  def show
    @visit = Ahoy::Visit.find_by(id: params[:id])
    @events = @visit.events
  end

end
