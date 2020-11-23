class AdminController < ApplicationController

    before_action :require_admin, only: :admin
    skip_before_action :track_ahoy_visit

    
    def login
        if is_admin?
            redirect_to admin_root_path
        end
    end

    def new_session
        if params[:password] == ENV['ADMIN']
            session[:admin] = true 
            redirect_to admin_root_path
        else
            render :login
        end
    end

    def logout
        session[:admin] = false
        redirect_to root_path
    end

    def reset
        if is_admin?
            Deadman.reset
            redirect_to admin_root_path
        else
            redirect_to login_path
        end
    end
end
