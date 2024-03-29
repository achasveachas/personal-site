class Admin::VisitsController < ApplicationController

  before_action :require_admin
  skip_before_action :track_ahoy_visit

  def index
    @visits = Ahoy::Visit.joins(:events).group("ahoy_visits.id").limit(100).reverse_order
    @blogposts = BlogPost.all
    @last_reset = Deadman.last_reset
    Deadman.reset
  end

  def show
    @visit = Ahoy::Visit.find_by(id: params[:id])
    @events = @visit.events
  end

end
