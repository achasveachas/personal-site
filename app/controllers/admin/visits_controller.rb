class Admin::VisitsController < ApplicationController

  before_action :require_admin
  skip_before_action :track_ahoy_visit

  def index
    @logs = Ahoy::Visit.all.reverse_order
  end

end
