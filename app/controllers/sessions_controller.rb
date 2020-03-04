class SessionsController < ApplicationController
    
    def new
        render :new #looks in app/views/sessions/new.html.erb
    end

    def create  
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
          flash[:notice] = "hey. no."
          redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to 'users/welcome'
    end
end
