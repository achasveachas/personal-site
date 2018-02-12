class AdminController < ApplicationController
    
    def login

    end

    def new_session
        if params[:password] == "test"
            session[:admin] = true 
            redirect_to projects_path
        else
            render :login
        end
    end

    def admin

    end

    def logout
        session[:admin] = false
        redirect_to root_path
    end
end
