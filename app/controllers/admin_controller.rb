class AdminController < ApplicationController
    skip_before_action :log_session
    before_action :require_admin, only: :admin

    
    def login

    end

    def new_session
        if params[:password] == ENV['ADMIN']
            session[:admin] = true 
            redirect_to admin_path
        else
            render :login
        end
    end

    def admin
        @logs = SessionLog.all.reverse_order
    end

    def logout
        session[:admin] = false
        redirect_to root_path
    end
end
