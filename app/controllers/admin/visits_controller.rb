class Admin::VisitsController < ApplicationController

  before_action :require_admin
  skip_before_action :track_ahoy_visit

  def index
    @visits = Ahoy::Visit.all.reverse_order
  end

  def show
    @visit = params[:id]
  end

end
